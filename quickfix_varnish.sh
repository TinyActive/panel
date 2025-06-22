#!/bin/bash

# Quick fix for Varnish VCL syntax error
echo "🔧 Quick fix Varnish VCL syntax error..."

# Fix the VCL file
if [ -f "/etc/varnish/default.vcl" ]; then
    echo "📝 Backing up and fixing VCL file..."
    cp /etc/varnish/default.vcl /etc/varnish/default.vcl.backup-quickfix
    
    # Remove the problematic line
    sed -i '/^[[:space:]]*unset req\.url;/d' /etc/varnish/default.vcl
    
    echo "✅ Fixed VCL syntax error"
    
    # Test VCL syntax
    echo "🧪 Testing VCL syntax..."
    if varnishd -C -f /etc/varnish/default.vcl >/dev/null 2>&1; then
        echo "✅ VCL syntax is now valid"
        
        # Restart Varnish
        echo "🔄 Restarting Varnish..."
        systemctl reset-failed varnish
        systemctl stop varnish
        sleep 2
        systemctl start varnish
        sleep 3
        
        if pgrep varnishd >/dev/null; then
            echo "🎉 Varnish is now running!"
            echo "📊 Port status:"
            ss -tulpn | grep :6081 || echo "❌ Port 6081 not listening"
        else
            echo "❌ Varnish still not running"
            echo "📋 Check logs: journalctl -u varnish -f"
        fi
    else
        echo "❌ VCL syntax still has errors:"
        varnishd -C -f /etc/varnish/default.vcl 2>&1 | head -5
    fi
else
    echo "❌ VCL file not found: /etc/varnish/default.vcl"
fi

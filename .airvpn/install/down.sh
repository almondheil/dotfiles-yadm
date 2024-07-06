#!/bin/bash

ifconfig tailscale0 up
tailscale up --accept-routes

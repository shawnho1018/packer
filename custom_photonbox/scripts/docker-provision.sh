#!/bin/bash

# Enable Docker to start at runtime
systemctl daemon-reload
systemctl enable docker

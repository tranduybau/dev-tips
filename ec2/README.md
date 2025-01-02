# DOCUMENTATION FOR EC2

## Setup ssh:

Start ssh-agent:
```bash
eval `ssh-agent -s`
```

## FATAL ERROR: Ineffective mark-compacts near heap limit Allocation failed - JavaScript heap out of memory

Dán dòng lệnh sau vào terminal:
```bash
export NODE_OPTIONS="--max-old-space-size=8192"
```

## Di chuyển folder

```bash
mv /home/ubuntu/code/frontend/ /home/ubuntu/code/frontend_old/
```

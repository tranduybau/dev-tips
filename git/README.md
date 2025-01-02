# DOCUMENTATION FOR GIT

## Xóa hết các folder untracked

```bash
git clean -fd
```

```bash
git clean -f
```

## Rebase với nhánh main ở trên git

```bash
git rebase main
```

## Overwrite lại source từ folder có sẵn

```bash
git branch -M main
git remote add origin git@github.com:MinhAnh-Corp/sto-chain-mainnet.git
git push -u origin main --force
```

## Last commit:
```bash
git log -1 --oneline
```

## Generate new ssh keys:
```bash
ssh-keygen -t ed25519 -C "trdbau@gmail.com"
```

## git xóa hết file change
```bash
git reset --hard
git clean -f
```
# replace version
cd alist-web
version=$(git describe --abbrev=0 --tags)
sed -i -e "s/0.0.0/$version/g" package.json
cat package.json

# build
pnpm install
pnpm i18n:release
pnpm build

rm -rf compress
mkdir compress
tar -czvf compress/dist.tar.gz dist/*
zip -r compress/dist.zip dist/*
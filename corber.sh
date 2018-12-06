echo "Corber things..."
unset npm_config_prefix
source  ~/.nvm/nvm.sh
nvm i --lts
npm i -g create-react-app corber json
create-react-app corber-react
cd corber-react
json -I -f package.json -e 'this.homepage="."'
echo 3 | corber init
cp ./src/logo.svg ./src/logo_white.svg
gsed -ri '/<svg /d' ./src/logo_white.svg
gsed -ri '/<g/i \<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 841.9 595.3\" style=\"enable-background:new 0 0 841.9 595.3; background:#fff\" >' ./src/logo_white.svg
cp ./src/logo_white.svg  ./corber/icon.svg
cp ./src/logo_white.svg  ./corber/splash.svg
corber make-splashes --platform ios
corber make-icons --platform ios
cp corber/cordova/res/screen/ios/2732-2048.png corber/cordova/res/screen/ios/Default@2x\~universal\~anyany.png
mkdir -p public/images/splash
cp corber/cordova/res/screen/ios/Default@2x\~universal\~anyany.png ./public/images/splash/Default@2x\~universal\~anyany.png 
## https://stackoverflow.com/a/45060217
brew install gnu-sed
##<meta name="apple-mobile-web-app-capable" content="yes" /> 
##<meta name="viewport" content="initial-scale=1, width=device-width, height=device-height, viewport-fit=cover">
##<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
gsed -ri '/<meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">/d' ./public/index.html
gsed -ri '/<head>/a \    <meta name=\"apple-mobile-web-app-capable\" content=\"yes\" \/>' ./public/index.html
gsed -ri '/<head>/a \    <meta name=\"viewport\" content=\"initial-scale=1, width=device-width, height=device-height, viewport-fit=cover\">' ./public/index.html
gsed -ri '/<head>/a \    <meta name=\"apple-mobile-web-app-status-bar-style\" content=\"black-translucent\">' ./public/index.html

echo "PWA things..."
json -I -f ./public/manifest.json -e 'this.short_name="corber-react"'
json -I -f ./public/manifest.json -e 'this.name="corber-react"'
cp ./corber/cordova/res/icon/ios/icon-24@2x.png ./public/favicon.io
cp ./corber/cordova/res/icon/ios/icon-24@2x.png ./public/images/icon.png
gsed -ri '/<head>/a \    <link rel=\"apple-touch-icon\" href=\"/images/icon.png\">' ./public/index.html

echo "Build things..."
corber b
corber o

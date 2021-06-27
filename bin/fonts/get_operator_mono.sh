#!/bin/sh

sudo mkdir operator
sudo wget https://github.com/coderJianXun/Operator-Mono/blob/master/src/Operator%20Mono/OperatorMono-BoldItalic.otf -P ./operator
sudo wget https://github.com/coderJianXun/Operator-Mono/blob/master/src/Operator%20Mono/OperatorMono-Book.otf -P ./operator
sudo wget https://github.com/coderJianXun/Operator-Mono/blob/master/src/Operator%20Mono/OperatorMono-BookItalic.otf -P ./operator
sudo wget https://github.com/coderJianXun/Operator-Mono/blob/master/src/Operator%20Mono/OperatorMono-Light.otf -P ./operator
sudo wget https://github.com/coderJianXun/Operator-Mono/blob/master/src/Operator%20Mono/OperatorMono-LightItalic.otf -P ./operator
sudo wget https://github.com/coderJianXun/Operator-Mono/blob/master/src/Operator%20Mono/OperatorMono-Medium.otf -P ./operator
sudo wget https://github.com/coderJianXun/Operator-Mono/blob/master/src/Operator%20Mono/OperatorMono-MediumItalic.otf -P ./operator
sudo wget https://github.com/coderJianXun/Operator-Mono/blob/master/src/Operator%20Mono/OperatorMono-XLight.otf -P ./operator
sudo wget https://github.com/coderJianXun/Operator-Mono/blob/master/src/Operator%20Mono/OperatorMono-XLightItalic.otf -P ./operator
sudo wget https://github.com/coderJianXun/Operator-Mono/blob/master/src/Operator%20Mono/OperatorMono-Bold.otf -P ./operator

sudo mv operator /usr/share/fonts/truetype/operator
sudo mv operator /usr/share/fonts/opentype/operator
sudo fc-cache -fv
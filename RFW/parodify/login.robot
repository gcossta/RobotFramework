***Settings***
Documentation       Testes da página login

Library             Browser
***Test Cases***
Login com sucesso
    Open Browser    https://parodify.herokuapp.com/users/sign_in    chromium
    Get Text        label[for=user_email]    contains    Email
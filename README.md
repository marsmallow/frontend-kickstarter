# frontend-kickstarter

![GitHub Logo](src/images/logo.jpg)

## Struktur

    |--build/  //Semua hasil production diletakkan disini
    |   |-- scripts/
    |   |-- images/
    |   |-- styles/
    |   index.html
    |   
    |--src/  //Development disini gan
    |   |-- scripts/
    |   |-- images/
    |   |-- styles/
    |   index.html
    |
    |-- gulpfile.coffee //Ini file gulpnya
    |-- package.json
    |-- README.md

## Kebutuhan
  - Nodejs
  - Gulp
  - Browser

## Instalasi Node.js
  - Via [nvm](https://github.com/creationix/nvm) (saran)
  - Via [binary](https://nodejs.org/en/)

## Install Gulp
  ``
    npm -g install gulp
  ``

## Jalankan
Masuk ke direktori project
update dependency melalui command
``
npm install
``
jalankan memakai command
``
gulp
``
otomatis akan membuka browser pada alamat ``localhost:3000``

# Requirement
## Deklarasi Variabel gulp plugin
gulp = require 'gulp'
browserSync = require 'browser-sync'
changed = require 'gulp-changed'
minifyHTML = require 'gulp-minify-html'
autoprefix = require 'gulp-autoprefixer'
concat = require 'gulp-concat'
minifyCSS = require 'gulp-clean-css'
sourcemaps = require 'gulp-sourcemaps'
imagemin = require 'gulp-imagemin'
uglify = require 'gulp-uglify'
stripDebug = require 'gulp-strip-debug'
size = require 'gulp-size'
uncss = require 'gulp-uncss'

#Path
local = { baseDir:"./build" }
serve = browserSync.create("Server") #browserSync init

#Source File
src =
  html:'./src/*.html'
  css:'./src/styles/**/*.css'
  img:'./src/images/**/*'
  js:'./src/scripts/**/*.js'

dst =
  html:'./build'
  css:'./build/styles/'
  img:'./build/images'
  js:'./build/scripts'

#Task

### -- browserSync Task -- ###
gulp.task 'browser-sync',->
  serve.init({
      port:3014,
      server: local
  })

### -- htmlmin Task -- ###
gulp.task 'htmlmin',->
  gulp.src(src.html)
    .pipe(changed(src.html))
    .pipe(minifyHTML())
    .pipe(gulp.dest(dst.html))

### -- styles Task -- ###
gulp.task 'css',->
  gulp.src(src.css)
  .pipe(concat('styles.css'))
  .pipe(sourcemaps.init())
  .pipe(autoprefix('last 2 versions'))
  .pipe(minifyCSS())
  .pipe(sourcemaps.write())
  .pipe(gulp.dest(dst.css))
  .pipe(size())
  .pipe(uncss({
    html: dst.html
   }))

### -- imagemin Task -- ###
gulp.task 'imagemin',->
  gulp.src(src.img)
  .pipe(changed(dst.img))
  .pipe(imagemin())
  .pipe(gulp.dest(dst.img))
  .pipe(size())

### -- scripts Task -- ###
gulp.task 'scripts',->
  gulp.src(src.js)
  .pipe(concat('scripts.js'))
  .pipe(stripDebug())
  .pipe(uglify())
  .pipe(gulp.dest(dst.js))
  .pipe(size())

gulp.task 'default', ['css', 'imagemin', 'scripts', 'browser-sync']

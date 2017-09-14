var gulp = require('gulp');
var sass = require('gulp-sass');
var concatenaCss = require('gulp-concat-css');
var cleanCSS = require('gulp-clean-css');
var rename = require('gulp-rename');
var concatena = require('gulp-concat');
var uglify = require('gulp-uglify');
var zip = require('gulp-zip');
var replace = require('gulp-replace');

gulp.task('disweb',['minify-css','minify-js','minify-calculations-js','minify-toggle-js','error-control-js']);

gulp.task('loginSass', function () {
  return gulp.src('./sass/login.scss')
    .pipe(sass().on('error', sass.logError))
    .pipe(gulp.dest('./dist/css'));
});

gulp.task('cardSass', function () {
  return gulp.src('./sass/cardCss.scss')
    .pipe(sass().on('error', sass.logError))
    .pipe(gulp.dest('./dist/css'));
});

gulp.task('listsSass', function () {
  return gulp.src('./sass/lists.scss')
    .pipe(sass().on('error', sass.logError))
    .pipe(gulp.dest('./dist/css'));
});

gulp.task('mainSass', function () {
  return gulp.src('./sass/main.scss')
    .pipe(sass().on('error', sass.logError))
    .pipe(gulp.dest('./dist/css'));
});
gulp.task('modalSass', function () {
  return gulp.src('./sass/modal.scss')
    .pipe(sass().on('error', sass.logError))
    .pipe(gulp.dest('./dist/css'));
});



gulp.task('concatena-css',['main-css','login-css', 'card-css','modal-css'], function() {
  return gulp.src(['./dist/css/main.css','./dist/css/login.css','./dist/css/cardCss.css','./dist/css/modal.css'])
    .pipe(concatenaCss('all.css'))
    .pipe(gulp.dest('./dist/css'));
});

gulp.task('minify-css',['concatena-css'], function() {
  return gulp.src('./dist/css/all.css')
    .pipe(cleanCSS())
    .pipe(rename("all.min.css"))
    .pipe(gulp.dest('../src/main/webapp/lib/css/'));
});
/*gulp.task('concatena-js', function() {
  return gulp.src([])
    .pipe(concatena('all.js'))
    .pipe(gulp.dest('./dist/js'));
});*/



gulp.task('login-css',['loginSass'], function() {
  return gulp.src('./dist/css/login.css')
    .pipe(cleanCSS())
    .pipe(rename("login.min.css"))
    .pipe(gulp.dest('../src/main/webapp/lib/css/'));
});

gulp.task('card-css',['cardSass'], function() {
  return gulp.src('./dist/css/cardCss.css')
    .pipe(cleanCSS())
    .pipe(rename("cardCss.min.css"))
    .pipe(gulp.dest('../src/main/webapp/lib/css/'));
});

gulp.task('lists-css',['listsSass'], function() {
  return gulp.src('./dist/css/lists.css')
    .pipe(cleanCSS())
    .pipe(rename("lists.min.css"))
    .pipe(gulp.dest('../src/main/webapp/lib/css/'));
});

gulp.task('main-css',['mainSass'], function() {
  return gulp.src('./dist/css/main.css')
    .pipe(cleanCSS())
    .pipe(rename("main.min.css"))
    .pipe(gulp.dest('../src/main/webapp/lib/css/'));
});

gulp.task('modal-css',['modalSass'], function() {
  return gulp.src('./dist/css/modal.css')
    .pipe(cleanCSS())
    .pipe(rename("modal.min.css"))
    .pipe(gulp.dest('../src/main/webapp/lib/css/'));
});



gulp.task('minify-calculations-js', function () {
	return gulp.src('./dist/js/calculations.js')
	.pipe(uglify())
	.pipe(rename("calculations.min.js"))
	.pipe(gulp.dest('../src/main/webapp/lib/js/'));

});

gulp.task('minify-toggle-js', function () {
	return gulp.src('./dist/js/toggle-classes.js')
	.pipe(uglify())
	.pipe(rename("toggle-classes.min.js"))
	.pipe(gulp.dest('../src/main/webapp/lib/js/'));

});

gulp.task('minify-js', function () {
	return gulp.src('./dist/js/libraries.js')
	.pipe(uglify())
	.pipe(rename("libraries.min.js"))
	.pipe(gulp.dest('../src/main/webapp/lib/js/'));

});

gulp.task('error-control-js', function () {
	return gulp.src('./dist/js/errorControl.js')
	.pipe(uglify())
	.pipe(rename("errorControl.min.js"))
	.pipe(gulp.dest('../src/main/webapp/lib/js/'));

});

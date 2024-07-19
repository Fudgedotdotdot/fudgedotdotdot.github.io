var gulp        = require('gulp');
var ghpages = require('gh-pages');

gulp.task('publish', function () {
	return ghpages.publish('./_book', {
		branch: 'master',
		}, function(err) {});
});
/**
 * Push build to gh-pages
 */
//var gulp        = require('gulp');
//var deploy      = require('gulp-gh-pages');
//gulp.task('publish', function () {
//  return gulp.src("./_book/**/*")
//    .pipe(deploy())
//});

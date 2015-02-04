module.exports = function (grunt) {
    'use strict';

    require('load-grunt-tasks')(grunt);

    grunt.config.init({
        config: {
            tmpDir: './tmp/'
        },

        copy_mate: {
            build: {
                options: {
                    type: 'recursive',
                    excludedDirs: [
                        '.svn',
                        '.idea'
                    ]
                },
                src: '../tv/',
                destDir: '<%= config.tmpDir %>'
            }
        },

        run: {
            options: {
                cwd: '<%= config.tmpDir %>'
            },
            build: {
                exec: 'make RELEASE="2.0.0"'
            }
        },

        compress: {
            build: {
                options: {
                    archive: 'package.zip'
                },
                files: [{
                    expand: true,
                    cwd: '<%= config.tmpDir %>',
                    src: '**/*'
                }]
            }
        },

        clean: {
            build: {
                src: ['<%= config.tmpDir %>']
            }
        }
    });

    grunt.registerTask('default', [
        'copy_mate',
        'compress',
        'clean'
    ]);

    grunt.registerTask('prod', [
        'copy_mate',
        'run',
        'compress',
        'clean'
    ]);
};
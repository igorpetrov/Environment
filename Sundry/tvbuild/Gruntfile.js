module.exports = function (grunt) {
    'use strict';

    require('load-grunt-tasks')(grunt);

    grunt.config.init({
        config: {
            tmpDir: './package'
        },

        clean: {
            build: {
                src: ['<%= config.tmpDir %>**/*']
            }
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
                src: '/data/tv/',
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
        }
    });

    grunt.registerTask('default', [
    	'clean',
        'copy_mate',
        'compress'
    ]);

    grunt.registerTask('prod', [
    	'clean',
        'copy_mate',
        'run',
        'compress'
    ]);
};

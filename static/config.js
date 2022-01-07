var path = require('path');

module.exports = {
    entry: './src/index.js',
    mode: 'development',
    output: {
        filename: 'index.js',
        path: path.resolve(__dirname, "js")
    },
};
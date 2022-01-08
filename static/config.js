var path = require('path');

const MiniCssExtractPlugin = require('mini-css-extract-plugin');
module.exports = {
    // entry: './src/js/index.js',
    entry: path.resolve(__dirname, 'src/js/index.js'),
    mode: 'development',
    output: {
        filename: 'index.js',
        path: path.resolve(__dirname, "js")
    },
    module: {
        rules: [
            {
                test: /\.(scss)$/,
                use: [
                    MiniCssExtractPlugin.loader,
                    'css-loader',
                    'sass-loader'
                ]
            }
        ],
    },
    devtool: "source-map",
    plugins: [
        new MiniCssExtractPlugin({
            filename: '../css/index.css',
            // filename: path.resolve(__dirname, "../css/index.css")
        })
    ],
    // devServer:{
    //     contentBase: path.join(__dirname, 'dist'),
    //     port: 3000,
    //     open: true,
    //
    // },
};
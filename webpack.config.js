const path = require('path');
const CopyPlugin = require('copy-webpack-plugin');
const CompressionPlugin = require('compression-webpack-plugin');

module.exports = {
    entry: {
        app: './src/index.ts',
        test: './src/test.ts'
    },
    devtool: 'source-map',
    target: 'node',
    plugins: [
        new CopyPlugin({
            patterns: [
                { from: 'src/assets/app', to: 'app/assets' },
                { from: 'src/assets/test', to: 'test/assets' },
                { from: 'docker/DockerFile', to: 'app' },
                { from: 'docker/DockerFile', to: 'test' }
            ],
        }),
    ],
    module: {
        rules: [
            {
                test: /\.ts$/,
                use: 'ts-loader', // 使用 ts-loader 处理.ts文件
                exclude: /node_modules/
            }
        ]
    },
    resolve: {
        extensions: ['.ts', '.js']
    },
    output: {
        filename: '[name]/bundle.js',
        path: path.resolve(__dirname, 'output/webpack')
    }
};
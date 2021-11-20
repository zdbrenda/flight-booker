process.env.NODE_ENV = process.env.NODE_ENV || 'development'

const { config } = require('@rails/webpacker')
const environment = require('./environment')

module.exports = environment.toWebpackConfig()



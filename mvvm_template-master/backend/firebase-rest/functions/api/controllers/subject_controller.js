// Author: Jumail 
// Email: jumail@utm.my
// Github:  github.com/jumail-utm
// Update: 5 Jun 2021

'use strict'

const Controller = require('./controller')
const subjectModel = require('../models/subject_model')

const subjectsController = new Controller(subjectModel)
module.exports = subjectsController.router
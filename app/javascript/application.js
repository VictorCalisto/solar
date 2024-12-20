// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import { Turbo } from "turbo";
import { Application } from "stimulus";
import { definitionsFromContext } from "stimulus/webpack-helpers";
import Rails from '@rails/ujs';

Rails.start();

const application = Application.start();
const context = require.context("controllers", true, /.js$/);
application.load(definitionsFromContext(context));


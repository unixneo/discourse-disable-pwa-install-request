# frozen_string_literal: true

# name: discourse-disable-pwa-install-request
# about: Disables PWA install banner
# version: 0.0.1
# date: 18 March 2021
# authors: Neo
# url: https://github.com/unixneo/discourse-selfish-seo-layout-changes

PLUGIN_NAME = "discourse-disable-pwa-install-request"
require_relative "./app/lib/strip_pwa"

after_initialize do
    DisablePwaInstall.modify_application_hbs
end

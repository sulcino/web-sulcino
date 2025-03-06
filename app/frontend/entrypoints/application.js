// To see this message, add the following to the `<head>` section in your
// views/layouts/application.html.erb
//
//    <%= vite_client_tag %>
//    <%= vite_javascript_tag 'application' %>
// console.log('Vite ⚡️ Rails')

// If using a TypeScript entrypoint file:
//     <%= vite_typescript_tag 'application' %>
//
// If you want to use .jsx or .tsx, add the extension:
//     <%= vite_javascript_tag 'application.jsx' %>

// console.log('Visit the guide for more information: ', 'https://vite-ruby.netlify.app/guide/rails')

// Example: Load Rails libraries in Vite.

// import ActiveStorage from '@rails/activestorage'
// ActiveStorage.start()
//
// // Import all channels.
// const channels = import.meta.globEager('./**/*_channel.js')


import * as Turbo from '@hotwired/turbo'
Turbo.start()

import Rails from '@rails/ujs';
Rails.start();

import '~/entrypoints/application.css'
import '~/stylesheets/blog_posts.css'
import '~/stylesheets/components.css'
import '~/stylesheets/modal.css'

import "~/controllers"

document.addEventListener('turbo:load', () => {
  const modal = document.getElementById('contactModal');
  if (!modal) return;
  const openModalLinks = document.querySelectorAll('[data-toggle="modal"]');
  const closeButtons = modal.querySelectorAll('[data-dismiss="modal"]');

  openModalLinks.forEach(link => {
    link.addEventListener('click', (e) => {
      e.preventDefault();
      modal.classList.add('active');
    });
  });

  closeButtons.forEach(btn => {
    btn.addEventListener('click', () => {
      modal.classList.remove('active');
    });
  });

  modal.addEventListener('click', (e) => {
    if (!e.target.closest('.modal-content')) {
      modal.classList.remove('active');
    }
  });
});

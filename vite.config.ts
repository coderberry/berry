import {defineConfig} from 'vite'
import RubyPlugin from 'vite-plugin-ruby'
import StimulusHMR from 'vite-plugin-stimulus-hmr'

export default defineConfig({
    clearScreen: false,
    plugins: [
        RubyPlugin(),
        StimulusHMR()
    ],
    build: {
        manifest: true,
        rollupOptions: {
            input: "/app/javascript/entrypoints/application.js"
        }
    }
})

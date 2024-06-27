/** @type {import('tailwindcss').Config} */
export default {
	content: [
		"./index.html",
		"./priv/**/*.{mjs,ts,jsx,tsx}",
		"./src/**/*.gleam",
	],
	theme: {
		fontFamily: {
			demo: ['Inter', 'Avenir', 'Helvetica', 'Arial', 'sans-serif'],
		},
		extend: {},
	},
	plugins: [],
}


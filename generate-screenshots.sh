#!/bin/sh

# The tape file
TAPE_FILE="screenshots.tape"

# The showcase directory
SHOWCASE_DIRECTORY="example"

# The screenshots directory
SCREENSHOTS_DIRECTORY="screenshots"

# Function to generate all the files needed
create_files() {

	# Make a directory
	mkdir -p example

	# Get a text file
	curl -L https://example.com/ -o example.html

	# Get a picture
	curl -L https://picsum.photos/200 -o example.jpg

	# Get a video
	curl -L https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4 -o example.mp4

	# Create a PDF file
	magick example.jpg -auto-orient example.pdf

	# Create an audio file
	ffmpeg -i example.mp4 -vn -acodec copy example.aac

	# Create an executable file
	touch example.sh
	chmod +x example.sh

	# Create an archive file
	7z a example.zip example.*

	# Create a broken symlink
	ln -s orphan example.link
}

# Function to setup all the files needed for the screenshots
setup() {

	# Create the screenshots and showcase directory
	mkdir -p $SCREENSHOTS_DIRECTORY $SHOWCASE_DIRECTORY

	# Go into the showcase directory
	cd $SHOWCASE_DIRECTORY || exit

	# Create all the required files
	create_files
}

# Function to generate the screenshots
generate_screenshots() {

	# Generate screenshots for the dark flavour
	vhs <"../$TAPE_FILE"

	# The tape file for the light flavour
	light_tape_file="${TAPE_FILE%.*}-light.tape"

	# Replace the dark with light and generate the screenshots
	sed 's/Dark/Light/' "../$TAPE_FILE" |
		sed 's/dark/light/' >"$light_tape_file"

	# Generate screenshots for the light flavour
	vhs <"$light_tape_file"

	# Exit the showcase directory
	cd ..

	# Remove the showcase directory
	rm -r $SHOWCASE_DIRECTORY
}

# Place the preview image in the correct place
place_previews() {

	# Place the preview images into the theme directories
	for theme in "light" "dark"; do
		cp "$SCREENSHOTS_DIRECTORY/files-$theme.png" \
			"bluloco-$theme.yazi/preview.png"
	done
}

# Main function
main() {

	# Setup the directories and create all the files
	setup

	# Generate the screenshots
	generate_screenshots

	# Place the preview images
	place_previews
}

# Run the main function
main

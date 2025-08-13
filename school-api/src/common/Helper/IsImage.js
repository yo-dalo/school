function isImage(file) {
    // Get the file extension
    const fileName = file;
    const fileExtension = fileName.split('.').pop().toLowerCase();

    // List of common image file extensions
    const imageExtensions = ['jpg', 'jpeg', 'png', 'gif', 'bmp', 'tiff'];

    // Check if the file extension is in the image extensions array
    if (imageExtensions.includes(fileExtension)) {
        return true;  // File is an image
    } else {
        return false; // File is not an image
    }
}

export default isImage
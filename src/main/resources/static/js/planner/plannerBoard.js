window.onload = () => {
	connect();
}

$(document).ready(function() {
    $('#summernote').summernote({
        height: 300,
        callbacks: {
            onInit: function() {
                let editableAreas = document.getElementsByClassName('note-editable');
                for (let i = 0; i < editableAreas.length; i++) {
                    editableAreas[i].addEventListener('textInput', function(e) {
                        console.log(e.data);
                    });
                }
            }
        }
    });
});
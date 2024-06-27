$(document).ready(function() {
	$('#summernote').summernote({
		height: 660,
		minHeight: null,
		maxHeight: null,
		focus: true
	});
});

function previewImage(event) {
    var reader = new FileReader();
    reader.onload = function(){
        var output = document.getElementById('preview');
        output.src = reader.result;
        output.style.display = 'block';
    };
    reader.readAsDataURL(event.target.files[0]);
}
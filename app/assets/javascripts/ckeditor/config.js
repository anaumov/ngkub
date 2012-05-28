CKEDITOR.editorConfig = function( config )
{
    config.toolbar = 'Post';

    config.toolbar_Post =
    [
        [ 'Source','Undo','Redo' ],
        [ 'Bold','Italic','Strike','-','RemoveFormat' ],
        [ 'NumberedList','BulletedList','Blockquote' ],
        [ 'Link','Unlink','Anchor' ],
        [ 'Image','Table'],
    ];
}


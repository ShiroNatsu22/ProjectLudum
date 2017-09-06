$('#comments-container').comments({
    fieldMappings: {
        parent: 'comment_id',
        modified: 'edited',
        fullname: 'name',
        profilePictureURL: 'user_image',
        upvoteCount: 'upvotes',
    }
});
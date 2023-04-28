function on_login (user, context, callback) {
    if (!is_valid(context)) {
        return callback(null, user, context);
    }
    const request = require('request');
    let body = {
        "user_id": user.user_id
    };
    if (user.email !== undefined) {
        body.email = user.email;
    }
    request.get(
        {
            url: "${dev_site}/on_login",
            json: true,
            body: body
        },
        function (err, response, body) {
            if (err) {
                return callback(err);
            } else if (response.statusCode >= 200 && response.statusCode <= 299) {
                return callback(null, user, context);
            } else {
                return callback(new UnauthorizedError("Could not insert user into database"));
            }
        }
    );

    function is_valid(context) {
        if (!('clientMetadata' in context)) {
            return false;
        }
        if (!('base_url' in context.clientMetadata)) {
            return false;
        }
        if (context.clientMetadata.base_url !== "${dev_site}") {
            return false;
        }
        return true;
    }
}

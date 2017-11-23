/**
 * API errors definition
 * @type {Object}
 */
module.exports = {
    auth_token_required: {
        error_code: 'SESSIONID_REQUIRED',
        description: 'User need to login before accessing this.'
    },

    invalid_auth_token: {
        error_code: 'INVALID_SESSIONID',
        description: 'This session has been expired'
    },

    invalid_auth_credentials: {
        error_code: 'INVALID_AUTH_CRED',
        description: 'Authorization credentials are invalid'
    },

    user_disabled: {
        error_code: 'USER_DISABLED',
        description:
      'User account has been disabled. API use or login is not allowed.'
    },

    already_registered: {
        error_code: 'ALREADY_REGISTERED',
        description: 'User is already registered'
    },

    invalid_operation: {
        error_code: 'INVALID_OPERATION',
        description:
      'The requested operation is not allowed due to logical or business rules. Cannot proceed.'
    },

    no_resource_access: {
        error_code: 'NO_RESOURCE_ACCESS',
        description:
      'User does not have required level of access to the requested resource.'
    },
    file_type_not_allowed: {
        error_code: 'INVALID_FILE_TYPE',
        description: 'This type of file cannot be uploaded.'
    },

    file_size_exceeds_limit: {
        error_code: 'FILE_SIZE_EXCEEDS_LIMIT',
        description: 'The file size exceeds the allowed limits.'
    },
    bidding_not_allowed: {
        error_code: 'BIDDING_NOT_ALLOWED',
        description: 'Bidding time for this auction has been expired'
    }
};

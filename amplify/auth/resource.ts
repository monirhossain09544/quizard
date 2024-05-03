import { defineAuth } from '@aws-amplify/backend';

export const auth = defineAuth({
  loginWith: {
    email: true
  },
  signUpOptions: {
    email: {
      required: true,
      verify: true
    }
  },
  mfa: {
    type: 'OTP',
    deliveryMethod: 'EMAIL'
  }
});


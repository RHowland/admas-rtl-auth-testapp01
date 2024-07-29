import * as v from 'valibot';
export const SignUpSchema = v.pipe(
v.object({
    email:  v.pipe(v.string(),v.nonEmpty('Please enter your email.'),v.email("Invalid Email address")), 
    firstName: v.pipe(
      v.string(),
      v.nonEmpty('Please enter your FirstName.'),
      v.minLength(2 , "First Must Have Two characters or more")),
    lastName: v.pipe(
        v.string(),
        v.nonEmpty('Please enter your LastName.'),
        v.minLength(2 , "Last Must Have Two characters or more")),
    password: v.pipe(
          v.string(),
          v.nonEmpty('Please enter your password.'),
          v.minLength(8, 'Your password must have 8 characters or more.')
        ),
    confirmPassword: v.string(),
  }),
  v.forward(
    v.partialCheck(
      [['password'], ['confirmPassword']],
      (input) => input.password === input.confirmPassword,
      'The two passwords do not match.'
    ),
    ['confirmPassword']
  )
)
export const NewPasswordSchema = v.pipe(
  v.object({
    password: v.pipe(
      v.string(),
      v.nonEmpty('Please enter your password.'),
      v.minLength(6, 'Password must be at least 6 characters long')
    ),
    confirmPassword: v.pipe(
      v.string(),
      v.nonEmpty('Please confirm your password.'),
      v.minLength(6, 'Password must be at least 6 characters long')
    ),
  }),
  v.forward(
    v.partialCheck(
      [['password'], ['confirmPassword']],
      (input) => input.password === input.confirmPassword,
      'Passwords do not match.'
    ),
    ['confirmPassword']
  )
);

export const SignInSchema = v.object({
  email: v.pipe(
    v.string(),
    v.nonEmpty('Please enter your email.'),
    v.email("Invalid email address")
  ),
  password: v.pipe(
    v.string(),
    v.nonEmpty('Please enter your password.'),
    v.minLength(6, 'Password must be at least 6 characters long')
  )
});

export const ResetPasswordSchema = v.object({
  email: v.pipe(
    v.string(),
    v.nonEmpty('Please enter your email.'),
    v.email("Invalid email address")
  )
});

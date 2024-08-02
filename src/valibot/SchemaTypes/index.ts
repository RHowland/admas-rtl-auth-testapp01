import * as v from 'valibot';

export const PasswordSchema = v.pipe(
  v.string(),
  v.minLength(12, 'Password must be at least 12 characters long'),
  v.regex(/[A-Z]/, "Password must contain at least one uppercase letter"),
  v.regex(/[a-z]/, "Password must contain at least one lowercase letter" ),
  v.regex(/[0-9]/,  "Password must contain at least one number" ),
  v.regex(/[@$!%*?&]/,  "Password must contain at least one special character ex: (@$!%*?&)")
)

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
    password: PasswordSchema,
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
    password:PasswordSchema,
    confirmPassword: v.string(),
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
  password: PasswordSchema
});

export const ResetPasswordSchema = v.object({
  email: v.pipe(
    v.string(),
    v.nonEmpty('Please enter your email.'),
    v.email("Invalid email address")
  )
});

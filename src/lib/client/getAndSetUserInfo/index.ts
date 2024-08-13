export const setUserInfo = (user) => {
  localStorage.setItem("userState", JSON.stringify(user));
}

export const getUserInfo = () => {
  const user = localStorage.getItem("userState");
  return user;
}
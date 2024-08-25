import { signOut } from "@root/src/lib/actions/auth/signOut";
import { Button } from "../ui/button";
import { setUserInfo } from "@root/src/lib/client/getAndSetUserInfo";

const SignOutBtn = () => {
  const handleSignOut = () => {
    setUserInfo("null");
    window.localStorage.setItem("showInactivityModal", `false`);
    // window.location.reload();
  }
  return (
    <div onClick={handleSignOut}>
      <form action={signOut}>
        <Button type="submit">Sign out</Button>
      </form>
    </div>
  );
};

export default SignOutBtn;

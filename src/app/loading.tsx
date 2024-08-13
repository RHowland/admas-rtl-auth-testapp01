import Container from "@/components/ui/custom/container";
import Spinner from "@/components/Sppinner";

export default function Loading() {
    // You can add any UI inside Loading, including a Skeleton.
    return (
      <Container>
        <div className="w-full h-screen flex justify-center items-center">
          <Spinner w={20} h={20} />
        </div>
      </Container>
    )
}
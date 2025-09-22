import { Navigate } from "react-router-dom";
import { useAuth } from "../context/AuthContext";

const ProtectedRoute = ({ children }) => {
  const { admin } = useAuth();
  return admin?.isLogin ? children : <Navigate to="/auth/signin"   replace/>;
};

export default ProtectedRoute;

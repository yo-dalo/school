import { createContext, useContext, useState,useEffect } from "react";
import { useNavigate } from 'react-router-dom';
import Yo from "../common/Helper/Yo"
import { toast } from 'react-toastify';
import eruda from "eruda"; 
import axios from "axios";

const AuthContext = createContext();

export const AuthProvider = ({ children }) => {
const go =   useNavigate()
  
  const [admin, setAdmin] = useState({
    isLogin:false,
    img:"",
    name:"_",
    phone:"",
    email:"",
    id:null,
    
  }); // or use token instead

const isLogin= async()=>{
   await Yo.get("/api/admin-auth/is-login").then((res)=>{
  //const res =  await axios.get("http://0.0.0.0:8081/school-api/api/bannerSlides/getall.php")
   const {name,phone,email,id, img}= res?.data
    setAdmin({...admin,
    isLogin:true,
    name:name,
    phone:phone,
    email:email,
    img,
    id:id,
      
    });
 }).catch((err)=>{
   console.log("isLogin filde")
   
 })
}


 useEffect(() => { 
   eruda.init();
  //isLogin()
  }, []);




  const login = async (adminData) => {
    try {
   const res =  await Yo.post("/api/admin-auth/login" ,
   //{phoneOrEmail:"1234567891",password:"10"}
   adminData
   )
   const {name,phone,email,id,img }= res?.data
    setAdmin({...admin,
    isLogin:true,
    name:name,
    phone:phone,
    email:email,
    id:id,
    img,
      
    });
    go("/")
    } catch (error) {
      toast.error(error.message)
    }
    
    
  };

  const logout = () => {
    setAdmin(null);
    // remove token from storage if used
  };

  return (
    <AuthContext.Provider value={{ admin, login, logout, }}>
      {children}
    </AuthContext.Provider>
  );
};

export const useAuth = () => useContext(AuthContext);

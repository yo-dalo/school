import React,{useState,useEffect} from 'react'

const InputEmail = ({label,placeholder,disabled,value,onChange,ignore=[],className}) => {
  const [complement, setComplement] = useState([]);
  const [name, setName] = useState([label]);

  
  
  useEffect(() => {
    const findComplement = () => {
    const result = name.filter((x) => !ignore.includes(x));
    
    setComplement(result);
  };
  findComplement()
    }, [label])

  
  
  return (
    <>
   {complement?.map((ignoreEle,i)=>(
                  <div key={i} className={`w-full xl:w-1/2 md:w-[45%] ${className}`}>
                    <label className="mb-2.5 block text-black dark:text-white">
                      {label?.split("_")?.join(" ")} <span className="text-meta-1">{disabled?"Not For Edit":""}</span> 
                    </label>
                    <input
                      type="email"
                      value={value}
                      onChange={onChange}
                      disabled={disabled}
                      placeholder={placeholder}
                      className="w-full rounded border-[1.5px] border-stroke bg-transparent py-3 px-5 text-black outline-none transition focus:border-primary active:border-primary disabled:cursor-default disabled:bg-whiter dark:border-form-strokedark dark:bg-form-input dark:text-white dark:focus:border-primary"
                    />
                  </div>
          ))}
  </>
  )
}

export default InputEmail
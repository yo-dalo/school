import React, { useState, useEffect } from 'react';
import axios from "axios";

interface SelectInputProps {
  url: string;
  name: string;
  optionShowBy: string;
  optionValue: string;
  setSelecter: (name: string, value: string) => void;
  selectedValue?: string;
  error?: any[];
  linkTo?: string;
  linkToValue?: string;
 options?: any[];
}

const SelectInput: React.FC<SelectInputProps> = ({
  url,
  name,
  optionShowBy,
  optionValue,
  setSelecter,
  selectedValue = "",
  error = [],
  linkTo,
  linkToValue,
  options = []
}) => {
  const [isOptionSelected, setIsOptionSelected] = useState<boolean>(false);
  const [resData, setResData] = useState<any[]>([]);
  const [isLoading, setIsLoading] = useState<boolean>(false);

  const changeTextColor = () => {
    setIsOptionSelected(true);
  };

  useEffect(() => {
    const controller = new AbortController();
    setIsLoading(true);

    const fetchData = async () => {
      try {
        const endpoint = linkTo && linkToValue 
          ? `${url}/${linkToValue}`
          : url;
        
        const res = await axios.get(endpoint, { 
          signal: controller.signal 
        });

        
        setResData(res.data.data.data || []);
      } catch (err) {
        if (!axios.isCancel(err)) {
          console.error("Fetch error:", err);
        }
      } finally {
        setIsLoading(false);
      }
    };

    fetchData();

    return () => {
      controller.abort();
    };
  }, [url, linkTo, linkToValue]);


useEffect(()=>{
     setResData(options|| []);  //is me problem h
},[url])




  return (
    <div className="mb-1">
      <label className="mb-2.5 block text-black dark:text-white">
        {name?.split("_")?.join(" ")}
      </label>

      <div className="relative z-20 bg-transparent dark:bg-form-input">
        {isLoading ? (
          <div className="flex items-center justify-center py-3 px-5">
            <span className="animate-spin">🌀</span>
            <span className="ml-2">Loading...</span>
          </div>
        ) : (
          <>
            <select
              value={selectedValue}
              onChange={(e) => {
                setSelecter(name, e.target.value);
                changeTextColor();
              }}
              className={`relative z-20 w-full appearance-none rounded border border-stroke bg-transparent py-3 px-5 outline-none transition focus:border-primary active:border-primary dark:border-form-strokedark dark:bg-form-input dark:focus:border-primary ${
                isOptionSelected || selectedValue 
                  ? 'text-black dark:text-white' 
                  : ''
              }`}
              disabled={isLoading}
            >
              <option value="" disabled className="text-body dark:text-bodydark">
                Select {name?.split("_")?.join(" ")}
              </option>
              
              {resData?.map((r, i) => (
                <option 
                  key={`${r[optionValue]}-${i}`} 
                  value={r[optionValue]} 
                  className="text-body dark:text-bodydark"
                >
                  {r[optionShowBy]}
                </option>
              ))}
            </select>

            <span className="absolute top-1/2 right-4 z-30 -translate-y-1/2">
              <svg
                className="fill-current"
                width="24"
                height="24"
                viewBox="0 0 24 24"
                fill="none"
                xmlns="http://www.w3.org/2000/svg"
              >
                <g opacity="0.8">
                  <path
                    fillRule="evenodd"
                    clipRule="evenodd"
                    d="M5.29289 8.29289C5.68342 7.90237 6.31658 7.90237 6.70711 8.29289L12 13.5858L17.2929 8.29289C17.6834 7.90237 18.3166 7.90237 18.7071 8.29289C19.0976 8.68342 19.0976 9.31658 18.7071 9.70711L12.7071 15.7071C12.3166 16.0976 11.6834 16.0976 11.2929 15.7071L5.29289 9.70711C4.90237 9.31658 4.90237 8.68342 5.29289 8.29289Z"
                    fill=""
                  ></path>
                </g>
              </svg>
            </span>
          </>
        )}
      </div>

      {error?.length > 0 && (
        <div className="mt-1 text-xs text-red-500">
          {error.join(", ")}
        </div>
      )}
    </div>
  );
};

export default SelectInput;
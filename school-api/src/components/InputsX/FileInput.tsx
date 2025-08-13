import React, { useState, useEffect } from "react";

interface FileInputProps {
  onChange: (event: React.ChangeEvent<HTMLInputElement>) => void;
  label: string;
  multiple?: boolean;
}

const FileInput: React.FC<FileInputProps> = ({ onChange, label, multiple }) => {
  const [imagePreview, setImagePreview] = useState<string[]>([]);

  const handleFileChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    if (!e.target.files) return;

    const files = Array.from(e.target.files);
    const previewUrls = files.map((file) => URL.createObjectURL(file as Blob)); // ✅ Explicitly cast to Blob

    setImagePreview(previewUrls);
  };

  // Cleanup object URLs to prevent memory leaks
  useEffect(() => {
    return () => {
      imagePreview.forEach((url) => URL.revokeObjectURL(url));
    };
  }, [imagePreview]);

  return (
    <div className="py-3 md:max-w-[45%]">
      <label className="mb-3 block text-black dark:text-white">{label}</label>
      <input
        type="file"
        multiple={multiple}
        onChange={(e) => {
          onChange(e);
          handleFileChange(e);
        }}
        className="w-full rounded-md border border-stroke p-3 outline-none transition file:mr-4 file:rounded file:border-[0.5px] file:border-stroke file:bg-[#EEEEEE] file:py-1 file:px-2.5 file:text-sm focus:border-primary file:focus:border-primary active:border-primary disabled:cursor-default disabled:bg-whiter dark:border-form-strokedark dark:bg-form-input dark:file:border-strokedark dark:file:bg-white/30 dark:file:text-white"
      />

      {/* Image Previews */}
      <div className="flex md:max-w-full w-full overflow-scroll">
        {imagePreview.map((src, index) => (
          <img
            key={index}
            src={src}
            className="w-full rounded-md border border-stroke p-3 mt-2 ml-3 outline-none transition"
            alt={`Preview ${index + 1}`}
          />
        ))}
      </div>
    </div>
  );
};

export default FileInput;

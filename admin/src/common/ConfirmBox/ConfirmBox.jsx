const ConfirmBox = ({msg,on=false}) => {
  if(!on){
    return;
  }
  return (
    <div className="fixed px-10 inset-0 z-50 flex items-center justify-center bg-black/30 backdrop-blur-xm">
      <div className="w-full max-w-md px-6 py-5 bg-white rounded-xl">
        <h1 className="text-lg font-semibold text-gray-800 mb-4">
          Kya aap ye kuch delete karna chahte hain? {msg}
        </h1>

        <div className="flex justify-end gap-4">
          <button className="px-4 py-2 text-sm font-medium text-blue-600 border border-blue-600 rounded hover:bg-blue-50 transition">
            Cancel
          </button>
          <button className="px-4 py-2 text-sm font-medium text-white bg-red-600 rounded hover:bg-red-700 transition">
            Delete
          </button>
        </div>
      </div>
    </div>
  )
};

export default ConfirmBox;
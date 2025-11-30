// components/MyEditor.js

import React, { useState } from 'react';
import { CKEditor } from '@ckeditor/ckeditor5-react';
import ClassicEditor from '@ckeditor/ckeditor5-build-classic';

const TestCkd = () => {
  const [editorData, setEditorData] = useState('');

  return (
    <div className="p-4">
      <h2 className="text-lg font-bold mb-2">CKEditor in React</h2>
      <CKEditor
        editor={ClassicEditor}
        data="<p>Type here...</p>"
        onChange={(event, editor) => {
          const data = editor.getData();
          setEditorData(data);
        }}
      />
      <div className="mt-4">
        <h3 className="font-semibold">Editor Output:</h3>
        <div dangerouslySetInnerHTML={{ __html: editorData }} />
      </div>
    </div>
  );
};

export default TestCkd;
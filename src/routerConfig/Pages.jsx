import Update from '../pages/Update';
import Page_ from '../pages/Page';
import Create from '../pages/Create';
import DataDisplay from '../pages/DataDisplay';
import {data} from '../Editer_tamplet/Page';

const PagesDisplay = [
  {
    path: "/Pages/display/:id",
    title: "pages display",
    page: <DataDisplay
      pageName="pages display"
      url={"/api/pages/?id="}
    />,
  }
];

const Pages = [
  [
    {
      path: "/Pages",
      pageName: "Pages",
      title:"Pages",
      page: <Page_
        pageName={"Pages"}
        url={"/api/pages/"}
        deleteUrl={"/api/pages/?id="}
      
      />,
    },
    {
      path: "/Pages/create",
      pageName: "Pages",
      url: "/api/pages/",
      title: "eCommerce Dashboard | Pages Create",
      page: <Create
        pageName={"Pages"}
        url="/api/pages/"
    
        inputs={[
          // { type: "number", name: "Pages_Category_Id" },
          {type:"option" , name:"Pages_Category_Id",
              url:"/api/pages_category/", 
             valueBy:"Id",
              optionBy:"Name"
             },
          
                    { type: "text", name: "Name" },
          { type: "number", name: "Index_No" },
          { type: "editer", name: "Page_Data", tamplet:[{code:data,name:"page"},{code:"<h2>helll</h2>",name:"page2"}] },
          { type: "option", name: "Is_Active", optionBy:"value", valueBy:"label"  , options: [
              { value: "active", label: "Active" },
              { value: "inactive", label: "Inactive" }
            ]
          },
          { type: "date", name: "Created_At" },
          { type: "date", name: "Updated_At" }
        ]}
      />,
    },
    {
      path: "/Pages/update/:id",
      pageName: "Pages",
      url: "/api/pages/?id=",
      title: "eCommerce Dashboard | Pages Update",
      page: <Update
        pageName="Pages"
        url="/api/pages/?id="
        getDataUrl="/api/pages/?get-for-update="
        inputs={[
           {type:"option" , name:"Pages_Category_Id",
              url:"/api/pages_category/", 
             valueBy:"Id",
              optionBy:"Name"
             },
          // { type: "number", name: "Pages_Category_Id" },
          { type: "text", name: "Name" },
          { type: "number", name: "Index_No" },
          { type: "editer", name: "Page_Data", tamplet:[{code:data,name:"page"},{code:"<h2>helll</h2>",name:"page2"}] },
          { type: "option", name: "Is_Active", optionBy:"label", valueBy:"value"  , options: [
              { value: "active", label: "Active" },
              { value: "inactive", label: "Inactive" }
            ]
          },
          { type: "date", name: "Created_At" },
          { type: "date", name: "Updated_At" }
        ]}
      />,
    },
    ...PagesDisplay
  ],
];

export { Pages };
import Update from '../pages/Update';
import Page_ from '../pages/Page';
import Create from '../pages/Create';
import DataDisplay from '../pages/DataDisplay';

const PagesCategoryDisplay = [
  {
    path: "/Pages_Category/display/:id",
    title: " pages category display",
    page: <DataDisplay
      pageName="pages category display"
      url={"/api/pages_category/?id="}
    />,
  }
];

const PagesCategory = [
  [
    {
      path: "/Pages_Category",
      pageName: "Pages_Category",
      title:"Pages_Category",
      page: <Page_
        pageName={"Pages_Category"}
        url={"/api/pages_category/"}
        deleteUrl={"/api/pages_category/?id="}
      />,
    },
    {
      path: "/Pages_Category/create",
      pageName: "Pages_Category",
      url: "/api/pages_category/",
      title: "eCommerce Dashboard | Pages Category Create",
      page: <Create
        pageName={"Pages_Category"}
        url="/api/pages_category/"
      
        inputs={[
          { type: "number", name: "Index_No" },
          { type: "text", name: "Name" },
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
      path: "/Pages_Category/update/:id",
      pageName: "Pages_Category",
      url: "/api/pages_category/?get-for-update=",
      title: "eCommerce Dashboard | Pages Category Update",
      page: <Update
        pageName="Pages_Category"
        url="/api/pages_category/?id="
        getDataUrl="/api/pages_category/?get-for-update="
        inputs={[
          { type: "number", name: "Index_No" },
          { type: "text", name: "Name" },
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
    ...PagesCategoryDisplay
  ],
];

export { PagesCategory };
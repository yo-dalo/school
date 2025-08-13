#!/bin/bash

# Create the notification directory
mkdir -p notification

# Create create.php
cat <<'EOPHP' > notification/create.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function create($conn) {
    validateRequestMethod('POST');
    $index_no = isset($_POST['Index_No']) ? intval($_POST['Index_No']) : null;
    $is_important = isset($_POST['Is_Important']) ? intval($_POST['Is_Important']) : 0;
    $title = safe($conn, $_POST['Title'] ?? '');
    $description = safe($conn, $_POST['Description'] ?? '');
    $date = safe($conn, $_POST['Date'] ?? '');
    $name = safe($conn, $_POST['Name'] ?? '');
    $is_active = safe($conn, $_POST['Is_Active'] ?? 'active');

    $sql = "INSERT INTO Notification (Index_No, Is_Important, Title, Description, Date, Name, Is_Active) VALUES (?, ?, ?, ?, ?, ?, ?)";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, 'iisssss',
        $index_no, $is_important, $title, $description, $date, $name, $is_active
    );
    
    if (mysqli_stmt_execute($stmt)) {
        sendResponse(200, true, 'Notification created', ['id' => mysqli_insert_id($conn)]);
    } else {
        sendResponse(500, false, 'Failed to create notification');
    }
}

//create($conn);
EOPHP

# Create get.php
cat <<'EOPHP' > notification/get.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function buildFilters($conn) {
    $filters = [];
    if (!empty($_GET['title'])) {
        $filters[] = "Title LIKE '%" . safe($conn, $_GET['title']) . "%'";
    }
    if (!empty($_GET['name'])) {
        $filters[] = "Name LIKE '%" . safe($conn, $_GET['name']) . "%'";
    }
    if (!empty($_GET['is_active'])) {
        $filters[] = "Is_Active = '" . safe($conn, $_GET['is_active']) . "'";
    }
    if (!empty($_GET['is_important'])) {
        $filters[] = "Is_Important = '" . safe($conn, $_GET['is_important']) . "'";
    }
    return $filters ? "WHERE " . implode(' AND ', $filters) : '';
}

function getAll($conn) {
    $filters = buildFilters($conn);
    $pagination = buildPagination();
    $sql = "SELECT * FROM Notification $filters ORDER BY Index_No ASC $pagination";
    $result = mysqli_query($conn, $sql);

    $rows = [];
    while ($row = mysqli_fetch_assoc($result)) {
        $rows[] = $row;
    }

    // Total count for pagination
    $count_sql = "SELECT COUNT(*) as total FROM Notification " . ($filters ? substr($filters, 6) : '');
    $count_result = mysqli_query($conn, $count_sql);
    $total = mysqli_fetch_assoc($count_result)['total'] ?? 0;

    sendResponse(200, true, 'Notifications fetched', [
        'data' => $rows,
        'pagination' => [
            'total' => $total,
            'page' => isset($_GET['page']) ? intval($_GET['page']) : 1,
            'limit' => isset($_GET['limit']) ? intval($_GET['limit']) : 10
        ]
    ]);
}

//getAll($conn);
EOPHP

# Create getById.php
cat <<'EOPHP' > notification/getById.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function getById($conn, $id_) {
    $id = isset($id_) ? (int)$id_ : 0;
    if (!$id) sendResponse(400, false, "Invalid Notification ID");

    $stmt = mysqli_prepare($conn, "SELECT * FROM Notification WHERE Id = ?");
    mysqli_stmt_bind_param($stmt, 'i', $id);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);
    if ($row = mysqli_fetch_assoc($result)) {
        sendResponse(200, true, "Notification found {$id_}", $row);
    } else {
        sendResponse(404, false, 'Notification not found');
    }
}

//getById($conn, $_GET["id"]);
EOPHP

# Create delete.php
cat <<'EOPHP' > notification/delete.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function delete_($conn, $id_) {
    validateRequestMethod('DELETE');

    $id = isset($id_) ? (int)$id_ : 0;
    if (!$id) sendResponse(400, false, "Invalid Notification ID");

    $sql = "DELETE FROM Notification WHERE Id = ?";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, 'i', $id);

    if (mysqli_stmt_execute($stmt)) {
        sendResponse(200, true, 'Notification deleted');
    } else {
        sendResponse(500, false, 'Failed to delete notification');
    }
}

//delete_($conn, $_GET["id"]);
EOPHP

# Create getByIdForUpdate.php
cat <<'EOPHP' > notification/getByIdForUpdate.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function getByIdForUpdate($conn, $id_) {
    $id = isset($id_) ? (int)$id_ : 0;
    if (!$id) sendResponse(400, false, "Invalid Notification ID");

    $stmt = mysqli_prepare($conn, "SELECT * FROM Notification WHERE Id = ?");
    mysqli_stmt_bind_param($stmt, 'i', $id);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);
    if ($row = mysqli_fetch_assoc($result)) {
        sendResponse(200, true, 'Notification found', $row);
    } else {
        sendResponse(404, false, 'Notification not found');
    }
}

//getByIdForUpdate($conn, $_GET["get-for-update"]);
EOPHP

# Create update.php
cat <<'EOPHP' > notification/update.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function update($conn) {
    validateRequestMethod('POST');
    
    $id = isset($_GET['id']) ? (int)$_GET['id'] : 0;
    if (!$id) sendResponse(400, false, "Invalid Notification ID");

    $index_no = isset($_POST['Index_No']) ? intval($_POST['Index_No']) : null;
    $is_important = isset($_POST['Is_Important']) ? intval($_POST['Is_Important']) : 0;
    $title = safe($conn, $_POST['Title'] ?? '');
    $description = safe($conn, $_POST['Description'] ?? '');
    $date = safe($conn, $_POST['Date'] ?? '');
    $name = safe($conn, $_POST['Name'] ?? '');
    $is_active = safe($conn, $_POST['Is_Active'] ?? 'active');

    $sql = "UPDATE Notification SET Index_No = ?, Is_Important = ?, Title = ?, Description = ?, Date = ?, Name = ?, Is_Active = ? WHERE Id = ?";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, 'iisssssi',
        $index_no, $is_important, $title, $description, $date, $name, $is_active, $id
    );
    
    if (mysqli_stmt_execute($stmt)) {
        sendResponse(201, true, 'Notification updated', ['id' => $id]);
    } else {
        sendResponse(500, false, 'Failed to update notification');
    }
}

//update($conn);
EOPHP

# Create notification.php
cat <<'EOPHP' > notification/notification.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';

switch ($_SERVER['REQUEST_METHOD']) {
    case 'GET':
        if (isset($_GET["get-for-update"])) {
            require_once './getByIdForUpdate.php';
            getByIdForUpdate($conn, $_GET["get-for-update"]);
        } elseif (isset($_GET["id"])) {
            require_once './getById.php';
            getById($conn, $_GET["id"]);
        } else {
            require_once './get.php';
            getAll($conn);
        }
        break;
    case 'POST':
        if (isset($_GET["id"])) {
            require_once './update.php';
            update($conn);
        } else {
            require_once './create.php';
            create($conn);
        }
        break;
    case 'DELETE':
        require_once './delete.php';
        delete_($conn, $_GET["id"]);
        break;
    default:
        sendResponse(405, false, 'Method Not Allowed');
        break;
}
EOPHP

echo "Notification API files have been set up successfully in the 'notification' directory."





#!/bin/bash

# Create the pages directory
mkdir -p pages

# Create create.php
cat <<'EOPHP' > pages/create.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function create($conn) {
    validateRequestMethod('POST');
    $pages_category_id = isset($_POST['Pages_Category_Id']) ? intval($_POST['Pages_Category_Id']) : null;
    $page_data = safe($conn, $_POST['Page_Data'] ?? '');
    $is_active = safe($conn, $_POST['Is_Active'] ?? 'active');

    $sql = "INSERT INTO Pages (Pages_Category_Id, Page_Data, Is_Active) VALUES (?, ?, ?)";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, 'iss',
        $pages_category_id, $page_data, $is_active
    );
    
    if (mysqli_stmt_execute($stmt)) {
        sendResponse(200, true, 'Page created', ['id' => mysqli_insert_id($conn)]);
    } else {
        sendResponse(500, false, 'Failed to create page');
    }
}

//create($conn);
EOPHP

# Create get.php
cat <<'EOPHP' > pages/get.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function buildFilters($conn) {
    $filters = [];
    if (!empty($_GET['pages_category_id'])) {
        $filters[] = "Pages_Category_Id = '" . safe($conn, $_GET['pages_category_id']) . "'";
    }
    if (!empty($_GET['is_active'])) {
        $filters[] = "Is_Active = '" . safe($conn, $_GET['is_active']) . "'";
    }
    return $filters ? "WHERE " . implode(' AND ', $filters) : '';
}

function getAll($conn) {
    $filters = buildFilters($conn);
    $pagination = buildPagination();
    $sql = "SELECT * FROM Pages $filters ORDER BY Created_At DESC $pagination";
    $result = mysqli_query($conn, $sql);

    $rows = [];
    while ($row = mysqli_fetch_assoc($result)) {
        $rows[] = $row;
    }

    // Total count for pagination
    $count_sql = "SELECT COUNT(*) as total FROM Pages " . ($filters ? substr($filters, 6) : '');
    $count_result = mysqli_query($conn, $count_sql);
    $total = mysqli_fetch_assoc($count_result)['total'] ?? 0;

    sendResponse(200, true, 'Pages fetched', [
        'data' => $rows,
        'pagination' => [
            'total' => $total,
            'page' => isset($_GET['page']) ? intval($_GET['page']) : 1,
            'limit' => isset($_GET['limit']) ? intval($_GET['limit']) : 10
        ]
    ]);
}

//getAll($conn);
EOPHP

# Create getById.php
cat <<'EOPHP' > pages/getById.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function getById($conn, $id_) {
    $id = isset($id_) ? (int)$id_ : 0;
    if (!$id) sendResponse(400, false, "Invalid Page ID");

    $stmt = mysqli_prepare($conn, "SELECT * FROM Pages WHERE Id = ?");
    mysqli_stmt_bind_param($stmt, 'i', $id);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);
    if ($row = mysqli_fetch_assoc($result)) {
        sendResponse(200, true, "Page found {$id_}", $row);
    } else {
        sendResponse(404, false, 'Page not found');
    }
}

//getById($conn, $_GET["id"]);
EOPHP

# Create delete.php
cat <<'EOPHP' > pages/delete.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function delete_($conn, $id_) {
    validateRequestMethod('DELETE');

    $id = isset($id_) ? (int)$id_ : 0;
    if (!$id) sendResponse(400, false, "Invalid Page ID");

    $sql = "DELETE FROM Pages WHERE Id = ?";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, 'i', $id);

    if (mysqli_stmt_execute($stmt)) {
        sendResponse(200, true, 'Page deleted');
    } else {
        sendResponse(500, false, 'Failed to delete page');
    }
}

//delete_($conn, $_GET["id"]);
EOPHP

# Create getByIdForUpdate.php
cat <<'EOPHP' > pages/getByIdForUpdate.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function getByIdForUpdate($conn, $id_) {
    $id = isset($id_) ? (int)$id_ : 0;
    if (!$id) sendResponse(400, false, "Invalid Page ID");

    $stmt = mysqli_prepare($conn, "SELECT * FROM Pages WHERE Id = ?");
    mysqli_stmt_bind_param($stmt, 'i', $id);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);
    if ($row = mysqli_fetch_assoc($result)) {
        sendResponse(200, true, 'Page found', $row);
    } else {
        sendResponse(404, false, 'Page not found');
    }
}

//getByIdForUpdate($conn, $_GET["get-for-update"]);
EOPHP

# Create update.php
cat <<'EOPHP' > pages/update.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function update($conn) {
    validateRequestMethod('POST');
    
    $id = isset($_GET['id']) ? (int)$_GET['id'] : 0;
    if (!$id) sendResponse(400, false, "Invalid Page ID");

    $pages_category_id = isset($_POST['Pages_Category_Id']) ? intval($_POST['Pages_Category_Id']) : null;
    $page_data = safe($conn, $_POST['Page_Data'] ?? '');
    $is_active = safe($conn, $_POST['Is_Active'] ?? 'active');

    $sql = "UPDATE Pages SET Pages_Category_Id = ?, Page_Data = ?, Is_Active = ? WHERE Id = ?";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, 'issi',
        $pages_category_id, $page_data, $is_active, $id
    );
    
    if (mysqli_stmt_execute($stmt)) {
        sendResponse(201, true, 'Page updated', ['id' => $id]);
    } else {
        sendResponse(500, false, 'Failed to update page');
    }
}

//update($conn);
EOPHP

# Create pages.php
cat <<'EOPHP' > pages/pages.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';

switch ($_SERVER['REQUEST_METHOD']) {
    case 'GET':
        if (isset($_GET["get-for-update"])) {
            require_once './getByIdForUpdate.php';
            getByIdForUpdate($conn, $_GET["get-for-update"]);
        } elseif (isset($_GET["id"])) {
            require_once './getById.php';
            getById($conn, $_GET["id"]);
        } else {
            require_once './get.php';
            getAll($conn);
        }
        break;
    case 'POST':
        if (isset($_GET["id"])) {
            require_once './update.php';
            update($conn);
        } else {
            require_once './create.php';
            create($conn);
        }
        break;
    case 'DELETE':
        require_once './delete.php';
        delete_($conn, $_GET["id"]);
        break;
    default:
        sendResponse(405, false, 'Method Not Allowed');
        break;
}
EOPHP

echo "Pages API files have been set up successfully in the 'pages' directory."




#!/bin/bash

# Create the pages_category directory
mkdir -p pages_category

# Create create.php
cat <<'EOPHP' > pages_category/create.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function create($conn) {
    validateRequestMethod('POST');
    $index_no = isset($_POST['Index_No']) ? intval($_POST['Index_No']) : null;
    $name = safe($conn, $_POST['Name'] ?? '');
    $url = safe($conn, $_POST['Url'] ?? '');
    $is_active = safe($conn, $_POST['Is_Active'] ?? 'active');

    $sql = "INSERT INTO Pages_Category (Index_No, Name, Url, Is_Active) VALUES (?, ?, ?, ?)";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, 'isss',
        $index_no, $name, $url, $is_active
    );
    
    if (mysqli_stmt_execute($stmt)) {
        sendResponse(200, true, 'Pages Category created', ['id' => mysqli_insert_id($conn)]);
    } else {
        sendResponse(500, false, 'Failed to create pages category');
    }
}

//create($conn);
EOPHP

# Create get.php
cat <<'EOPHP' > pages_category/get.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function buildFilters($conn) {
    $filters = [];
    if (!empty($_GET['name'])) {
        $filters[] = "Name LIKE '%" . safe($conn, $_GET['name']) . "%'";
    }
    if (!empty($_GET['is_active'])) {
        $filters[] = "Is_Active = '" . safe($conn, $_GET['is_active']) . "'";
    }
    return $filters ? "WHERE " . implode(' AND ', $filters) : '';
}

function getAll($conn) {
    $filters = buildFilters($conn);
    $pagination = buildPagination();
    $sql = "SELECT * FROM Pages_Category $filters ORDER BY Index_No ASC $pagination";
    $result = mysqli_query($conn, $sql);

    $rows = [];
    while ($row = mysqli_fetch_assoc($result)) {
        $rows[] = $row;
    }

    // Total count for pagination
    $count_sql = "SELECT COUNT(*) as total FROM Pages_Category " . ($filters ? substr($filters, 6) : '');
    $count_result = mysqli_query($conn, $count_sql);
    $total = mysqli_fetch_assoc($count_result)['total'] ?? 0;

    sendResponse(200, true, 'Pages Categories fetched', [
        'data' => $rows,
        'pagination' => [
            'total' => $total,
            'page' => isset($_GET['page']) ? intval($_GET['page']) : 1,
            'limit' => isset($_GET['limit']) ? intval($_GET['limit']) : 10
        ]
    ]);
}

//getAll($conn);
EOPHP

# Create getById.php
cat <<'EOPHP' > pages_category/getById.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function getById($conn, $id_) {
    $id = isset($id_) ? (int)$id_ : 0;
    if (!$id) sendResponse(400, false, "Invalid Pages Category ID");

    $stmt = mysqli_prepare($conn, "SELECT * FROM Pages_Category WHERE Id = ?");
    mysqli_stmt_bind_param($stmt, 'i', $id);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);
    if ($row = mysqli_fetch_assoc($result)) {
        sendResponse(200, true, "Pages Category found {$id_}", $row);
    } else {
        sendResponse(404, false, 'Pages Category not found');
    }
}

//getById($conn, $_GET["id"]);
EOPHP

# Create delete.php
cat <<'EOPHP' > pages_category/delete.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function delete_($conn, $id_) {
    validateRequestMethod('DELETE');

    $id = isset($id_) ? (int)$id_ : 0;
    if (!$id) sendResponse(400, false, "Invalid Pages Category ID");

    $sql = "DELETE FROM Pages_Category WHERE Id = ?";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, 'i', $id);

    if (mysqli_stmt_execute($stmt)) {
        sendResponse(200, true, 'Pages Category deleted');
    } else {
        sendResponse(500, false, 'Failed to delete pages category');
    }
}

//delete_($conn, $_GET["id"]);
EOPHP

# Create getByIdForUpdate.php
cat <<'EOPHP' > pages_category/getByIdForUpdate.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function getByIdForUpdate($conn, $id_) {
    $id = isset($id_) ? (int)$id_ : 0;
    if (!$id) sendResponse(400, false, "Invalid Pages Category ID");

    $stmt = mysqli_prepare($conn, "SELECT * FROM Pages_Category WHERE Id = ?");
    mysqli_stmt_bind_param($stmt, 'i', $id);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);
    if ($row = mysqli_fetch_assoc($result)) {
        sendResponse(200, true, 'Pages Category found', $row);
    } else {
        sendResponse(404, false, 'Pages Category not found');
    }
}

//getByIdForUpdate($conn, $_GET["get-for-update"]);
EOPHP

# Create update.php
cat <<'EOPHP' > pages_category/update.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function update($conn) {
    validateRequestMethod('POST');
    
    $id = isset($_GET['id']) ? (int)$_GET['id'] : 0;
    if (!$id) sendResponse(400, false, "Invalid Pages Category ID");

    $index_no = isset($_POST['Index_No']) ? intval($_POST['Index_No']) : null;
    $name = safe($conn, $_POST['Name'] ?? '');
    $url = safe($conn, $_POST['Url'] ?? '');
    $is_active = safe($conn, $_POST['Is_Active'] ?? 'active');

    $sql = "UPDATE Pages_Category SET Index_No = ?, Name = ?, Url = ?, Is_Active = ? WHERE Id = ?";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, 'isssi',
        $index_no, $name, $url, $is_active, $id
    );
    
    if (mysqli_stmt_execute($stmt)) {
        sendResponse(201, true, 'Pages Category updated', ['id' => $id]);
    } else {
        sendResponse(500, false, 'Failed to update pages category');
    }
}

//update($conn);
EOPHP

# Create pages_category.php
cat <<'EOPHP' > pages_category/pages_category.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';

switch ($_SERVER['REQUEST_METHOD']) {
    case 'GET':
        if (isset($_GET["get-for-update"])) {
            require_once './getByIdForUpdate.php';
            getByIdForUpdate($conn, $_GET["get-for-update"]);
        } elseif (isset($_GET["id"])) {
            require_once './getById.php';
            getById($conn, $_GET["id"]);
        } else {
            require_once './get.php';
            getAll($conn);
        }
        break;
    case 'POST':
        if (isset($_GET["id"])) {
            require_once './update.php';
            update($conn);
        } else {
            require_once './create.php';
            create($conn);
        }
        break;
    case 'DELETE':
        require_once './delete.php';
        delete_($conn, $_GET["id"]);
        break;
    default:
        sendResponse(405, false, 'Method Not Allowed');
        break;
}
EOPHP

echo "Pages Category API files have been set up successfully in the 'pages_category' directory."






#!/bin/bash

# Create the poster directory
mkdir -p poster

# Create create.php
cat <<'EOPHP' > poster/create.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/upload.php';
require_once '../../utility/function.php';

/* Important note: 
When the SQL table includes an Image, data comes as multipart/form-data. 
When there’s no image, data comes as JSON. This example handles image uploads.
*/

function create($conn) {
    validateRequestMethod('POST');
    $index_no = isset($_POST['Index_No']) ? intval($_POST['Index_No']) : null;
    $url = safe($conn, $_POST['Url'] ?? '');
    $name = safe($conn, $_POST['Name'] ?? '');
    $is_active = safe($conn, $_POST['Is_Active'] ?? 'active');
    
    $image_path = null;

    if (!empty($_FILES['Image']['name'])) {
        $upload = upload('Image', '../../Uploads/');
        if (!$upload['success']) sendResponse(400, false, $upload['message']);
        $image_path = $upload['fileName'];
    }

    $sql = "INSERT INTO Poster (Index_No, Url, Image, Name, Is_Active) VALUES (?, ?, ?, ?, ?)";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, 'issss',
        $index_no, $url, $image_path, $name, $is_active
    );
    
    if (mysqli_stmt_execute($stmt)) {
        sendResponse(200, true, 'Poster created', ['id' => mysqli_insert_id($conn)]);
    } else {
        sendResponse(500, false, 'Failed to create poster');
    }
}

//create($conn);
EOPHP

# Create get.php
cat <<'EOPHP' > poster/get.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function buildFilters($conn) {
    $filters = [];
    if (!empty($_GET['name'])) {
        $filters[] = "Name LIKE '%" . safe($conn, $_GET['name']) . "%'";
    }
    if (!empty($_GET['is_active'])) {
        $filters[] = "Is_Active = '" . safe($conn, $_GET['is_active']) . "'";
    }
    return $filters ? "WHERE " . implode(' AND ', $filters) : '';
}

function getAll($conn) {
    $filters = buildFilters($conn);
    $pagination = buildPagination();
    $sql = "SELECT * FROM Poster $filters ORDER BY Index_No ASC $pagination";
    $result = mysqli_query($conn, $sql);

    $rows = [];
    while ($row = mysqli_fetch_assoc($result)) {
        $rows[] = $row;
    }

    // Total count for pagination
    $count_sql = "SELECT COUNT(*) as total FROM Poster " . ($filters ? substr($filters, 6) : '');
    $count_result = mysqli_query($conn, $count_sql);
    $total = mysqli_fetch_assoc($count_result)['total'] ?? 0;

    sendResponse(200, true, 'Posters fetched', [
        'data' => $rows,
        'pagination' => [
            'total' => $total,
            'page' => isset($_GET['page']) ? intval($_GET['page']) : 1,
            'limit' => isset($_GET['limit']) ? intval($_GET['limit']) : 10
        ]
    ]);
}

//getAll($conn);
EOPHP

# Create getById.php
cat <<'EOPHP' > poster/getById.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function getById($conn, $id_) {
    $id = isset($id_) ? (int)$id_ : 0;
    if (!$id) sendResponse(400, false, "Invalid Poster ID");

    $stmt = mysqli_prepare($conn, "SELECT * FROM Poster WHERE Id = ?");
    mysqli_stmt_bind_param($stmt, 'i', $id);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);
    if ($row = mysqli_fetch_assoc($result)) {
        sendResponse(200, true, "Poster found {$id_}", $row);
    } else {
        sendResponse(404, false, 'Poster not found');
    }
}

//getById($conn, $_GET["id"]);
EOPHP

# Create delete.php
cat <<'EOPHP' > poster/delete.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function delete_($conn, $id_) {
    validateRequestMethod('DELETE');

    $id = isset($id_) ? (int)$id_ : 0;
    if (!$id) sendResponse(400, false, "Invalid Poster ID");

    $sql = "DELETE FROM Poster WHERE Id = ?";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, 'i', $id);

    if (mysqli_stmt_execute($stmt)) {
        sendResponse(200, true, 'Poster deleted');
    } else {
        sendResponse(500, false, 'Failed to delete poster');
    }
}

//delete_($conn, $_GET["id"]);
EOPHP

# Create getByIdForUpdate.php
cat <<'EOPHP' > poster/getByIdForUpdate.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function getByIdForUpdate($conn, $id_) {
    $id = isset($id_) ? (int)$id_ : 0;
    if (!$id) sendResponse(400, false, "Invalid Poster ID");

    $stmt = mysqli_prepare($conn, "SELECT * FROM Poster WHERE Id = ?");
    mysqli_stmt_bind_param($stmt, 'i', $id);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);
    if ($row = mysqli_fetch_assoc($result)) {
        sendResponse(200, true, 'Poster found', $row);
    } else {
        sendResponse(404, false, 'Poster not found');
    }
}

//getByIdForUpdate($conn, $_GET["get-for-update"]);
EOPHP

# Create update.php
cat <<'EOPHP' > poster/update.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/upload.php';
require_once '../../utility/function.php';

function update($conn) {
    validateRequestMethod('POST');
    
    $id = isset($_GET['id']) ? (int)$_GET['id'] : 0;
    if (!$id) sendResponse(400, false, "Invalid Poster ID");

    $index_no = isset($_POST['Index_No']) ? intval($_POST['Index_No']) : null;
    $url = safe($conn, $_POST['Url'] ?? '');
    $name = safe($conn, $_POST['Name'] ?? '');
    $is_active = safe($conn, $_POST['Is_Active'] ?? 'active');

    $image_path = null;

    if (!empty($_FILES['Image']['name'])) {
        $upload = upload('Image', '../../Uploads/');
        if (!$upload['success']) sendResponse(400, false, $upload['message']);
        $image_path = $upload['fileName'];
    }

    $sql = "UPDATE Poster SET Index_No = ?, Url = ?, Image = ?, Name = ?, Is_Active = ? WHERE Id = ?";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, 'issssi',
        $index_no, $url, $image_path, $name, $is_active, $id
    );
    
    if (mysqli_stmt_execute($stmt)) {
        sendResponse(201, true, 'Poster updated', ['id' => $id]);
    } else {
        sendResponse(500, false, 'Failed to update poster');
    }
}

//update($conn);
EOPHP

# Create poster.php
cat <<'EOPHP' > poster/poster.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';

switch ($_SERVER['REQUEST_METHOD']) {
    case 'GET':
        if (isset($_GET["get-for-update"])) {
            require_once './getByIdForUpdate.php';
            getByIdForUpdate($conn, $_GET["get-for-update"]);
        } elseif (isset($_GET["id"])) {
            require_once './getById.php';
            getById($conn, $_GET["id"]);
        } else {
            require_once './get.php';
            getAll($conn);
        }
        break;
    case 'POST':
        if (isset($_GET["id"])) {
            require_once './update.php';
            update($conn);
        } else {
            require_once './create.php';
            create($conn);
        }
        break;
    case 'DELETE':
        require_once './delete.php';
        delete_($conn, $_GET["id"]);
        break;
    default:
        sendResponse(405, false, 'Method Not Allowed');
        break;
}
EOPHP

echo "Poster API files have been set up successfully in the 'poster' directory."






#!/bin/bash

# Create the quick_link directory
mkdir -p quick_link

# Create create.php
cat <<'EOPHP' > quick_link/create.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function create($conn) {
    validateRequestMethod('POST');
    $index_no = isset($_POST['Index_No']) ? intval($_POST['Index_No']) : null;
    $url = safe($conn, $_POST['Url'] ?? '');
    $name = safe($conn, $_POST['Name'] ?? '');
    $is_active = safe($conn, $_POST['Is_Active'] ?? 'active');

    $sql = "INSERT INTO Quick_Link (Index_No, Url, Name, Is_Active) VALUES (?, ?, ?, ?)";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, 'isss',
        $index_no, $url, $name, $is_active
    );
    
    if (mysqli_stmt_execute($stmt)) {
        sendResponse(200, true, 'Quick Link created', ['id' => mysqli_insert_id($conn)]);
    } else {
        sendResponse(500, false, 'Failed to create quick link');
    }
}

//create($conn);
EOPHP

# Create get.php
cat <<'EOPHP' > quick_link/get.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function buildFilters($conn) {
    $filters = [];
    if (!empty($_GET['name'])) {
        $filters[] = "Name LIKE '%" . safe($conn, $_GET['name']) . "%'";
    }
    if (!empty($_GET['is_active'])) {
        $filters[] = "Is_Active = '" . safe($conn, $_GET['is_active']) . "'";
    }
    return $filters ? "WHERE " . implode(' AND ', $filters) : '';
}

function getAll($conn) {
    $filters = buildFilters($conn);
    $pagination = buildPagination();
    $sql = "SELECT * FROM Quick_Link $filters ORDER BY Index_No ASC $pagination";
    $result = mysqli_query($conn, $sql);

    $rows = [];
    while ($row = mysqli_fetch_assoc($result)) {
        $rows[] = $row;
    }

    // Total count for pagination
    $count_sql = "SELECT COUNT(*) as total FROM Quick_Link " . ($filters ? substr($filters, 6) : '');
    $count_result = mysqli_query($conn, $count_sql);
    $total = mysqli_fetch_assoc($count_result)['total'] ?? 0;

    sendResponse(200, true, 'Quick Links fetched', [
        'data' => $rows,
        'pagination' => [
            'total' => $total,
            'page' => isset($_GET['page']) ? intval($_GET['page']) : 1,
            'limit' => isset($_GET['limit']) ? intval($_GET['limit']) : 10
        ]
    ]);
}

//getAll($conn);
EOPHP

# Create getById.php
cat <<'EOPHP' > quick_link/getById.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function getById($conn, $id_) {
    $id = isset($id_) ? (int)$id_ : 0;
    if (!$id) sendResponse(400, false, "Invalid Quick Link ID");

    $stmt = mysqli_prepare($conn, "SELECT * FROM Quick_Link WHERE Id = ?");
    mysqli_stmt_bind_param($stmt, 'i', $id);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);
    if ($row = mysqli_fetch_assoc($result)) {
        sendResponse(200, true, "Quick Link found {$id_}", $row);
    } else {
        sendResponse(404, false, 'Quick Link not found');
    }
}

//getById($conn, $_GET["id"]);
EOPHP

# Create delete.php
cat <<'EOPHP' > quick_link/delete.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function delete_($conn, $id_) {
    validateRequestMethod('DELETE');

    $id = isset($id_) ? (int)$id_ : 0;
    if (!$id) sendResponse(400, false, "Invalid Quick Link ID");

    $sql = "DELETE FROM Quick_Link WHERE Id = ?";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, 'i', $id);

    if (mysqli_stmt_execute($stmt)) {
        sendResponse(200, true, 'Quick Link deleted');
    } else {
        sendResponse(500, false, 'Failed to delete quick link');
    }
}

//delete_($conn, $_GET["id"]);
EOPHP

# Create getByIdForUpdate.php
cat <<'EOPHP' > quick_link/getByIdForUpdate.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function getByIdForUpdate($conn, $id_) {
    $id = isset($id_) ? (int)$id_ : 0;
    if (!$id) sendResponse(400, false, "Invalid Quick Link ID");

    $stmt = mysqli_prepare($conn, "SELECT * FROM Quick_Link WHERE Id = ?");
    mysqli_stmt_bind_param($stmt, 'i', $id);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);
    if ($row = mysqli_fetch_assoc($result)) {
        sendResponse(200, true, 'Quick Link found', $row);
    } else {
        sendResponse(404, false, 'Quick Link not found');
    }
}

//getByIdForUpdate($conn, $_GET["get-for-update"]);
EOPHP

# Create update.php
cat <<'EOPHP' > quick_link/update.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function update($conn) {
    validateRequestMethod('POST');
    
    $id = isset($_GET['id']) ? (int)$_GET['id'] : 0;
    if (!$id) sendResponse(400, false, "Invalid Quick Link ID");

    $index_no = isset($_POST['Index_No']) ? intval($_POST['Index_No']) : null;
    $url = safe($conn, $_POST['Url'] ?? '');
    $name = safe($conn, $_POST['Name'] ?? '');
    $is_active = safe($conn, $_POST['Is_Active'] ?? 'active');

    $sql = "UPDATE Quick_Link SET Index_No = ?, Url = ?, Name = ?, Is_Active = ? WHERE Id = ?";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, 'isssi',
        $index_no, $url, $name, $is_active, $id
    );
    
    if (mysqli_stmt_execute($stmt)) {
        sendResponse(201, true, 'Quick Link updated', ['id' => $id]);
    } else {
        sendResponse(500, false, 'Failed to update quick link');
    }
}

//update($conn);
EOPHP

# Create quick_link.php
cat <<'EOPHP' > quick_link/quick_link.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';

switch ($_SERVER['REQUEST_METHOD']) {
    case 'GET':
        if (isset($_GET["get-for-update"])) {
            require_once './getByIdForUpdate.php';
            getByIdForUpdate($conn, $_GET["get-for-update"]);
        } elseif (isset($_GET["id"])) {
            require_once './getById.php';
            getById($conn, $_GET["id"]);
        } else {
            require_once './get.php';
            getAll($conn);
        }
        break;
    case 'POST':
        if (isset($_GET["id"])) {
            require_once './update.php';
            update($conn);
        } else {
            require_once './create.php';
            create($conn);
        }
        break;
    case 'DELETE':
        require_once './delete.php';
        delete_($conn, $_GET["id"]);
        break;
    default:
        sendResponse(405, false, 'Method Not Allowed');
        break;
}
EOPHP

echo "Quick Link API files have been set up successfully in the 'quick_link' directory."










#!/bin/bash

# Create the result_10th directory
mkdir -p result_10th

# Create create.php
cat <<'EOPHP' > result_10th/create.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/upload.php';
require_once '../../utility/function.php';

/* Important note: 
When the SQL table includes an Image, data comes as multipart/form-data. 
When there’s no image, data comes as JSON. This example handles image uploads.
*/

function create($conn) {
    validateRequestMethod('POST');
    $student_name = safe($conn, $_POST['Student_Name'] ?? '');
    $index_no = isset($_POST['Index_No']) ? intval($_POST['Index_No']) : null;
    $marks_percentage = safe($conn, $_POST['Marks_Percentage'] ?? '');
    $description = safe($conn, $_POST['Description'] ?? '');
    $is_active = safe($conn, $_POST['Is_Active'] ?? 'active');
    
    $image_path = null;

    if (!empty($_FILES['Image']['name'])) {
        $upload = upload('Image', '../../Uploads/');
        if (!$upload['success']) sendResponse(400, false, $upload['message']);
        $image_path = $upload['fileName'];
    }

    $sql = "INSERT INTO Result_10th (Student_Name, Index_No, Image, Marks_Percentage, Description, Is_Active) VALUES (?, ?, ?, ?, ?, ?)";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, 'sissss',
        $student_name, $index_no, $image_path, $marks_percentage, $description, $is_active
    );
    
    if (mysqli_stmt_execute($stmt)) {
        sendResponse(200, true, 'Result created', ['id' => mysqli_insert_id($conn)]);
    } else {
        sendResponse(500, false, 'Failed to create result');
    }
}

//create($conn);
EOPHP

# Create get.php
cat <<'EOPHP' > result_10th/get.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function buildFilters($conn) {
    $filters = [];
    if (!empty($_GET['student_name'])) {
        $filters[] = "Student_Name LIKE '%" . safe($conn, $_GET['student_name']) . "%'";
    }
    if (!empty($_GET['is_active'])) {
        $filters[] = "Is_Active = '" . safe($conn, $_GET['is_active']) . "'";
    }
    return $filters ? "WHERE " . implode(' AND ', $filters) : '';
}

function getAll($conn) {
    $filters = buildFilters($conn);
    $pagination = buildPagination();
    $sql = "SELECT * FROM Result_10th $filters ORDER BY Index_No ASC $pagination";
    $result = mysqli_query($conn, $sql);

    $rows = [];
    while ($row = mysqli_fetch_assoc($result)) {
        $rows[] = $row;
    }

    // Total count for pagination
    $count_sql = "SELECT COUNT(*) as total FROM Result_10th " . ($filters ? substr($filters, 6) : '');
    $count_result = mysqli_query($conn, $count_sql);
    $total = mysqli_fetch_assoc($count_result)['total'] ?? 0;

    sendResponse(200, true, 'Results fetched', [
        'data' => $rows,
        'pagination' => [
            'total' => $total,
            'page' => isset($_GET['page']) ? intval($_GET['page']) : 1,
            'limit' => isset($_GET['limit']) ? intval($_GET['limit']) : 10
        ]
    ]);
}

//getAll($conn);
EOPHP

# Create getById.php
cat <<'EOPHP' > result_10th/getById.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function getById($conn, $id_) {
    $id = isset($id_) ? (int)$id_ : 0;
    if (!$id) sendResponse(400, false, "Invalid Result ID");

    $stmt = mysqli_prepare($conn, "SELECT * FROM Result_10th WHERE Id = ?");
    mysqli_stmt_bind_param($stmt, 'i', $id);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);
    if ($row = mysqli_fetch_assoc($result)) {
        sendResponse(200, true, "Result found {$id_}", $row);
    } else {
        sendResponse(404, false, 'Result not found');
    }
}

//getById($conn, $_GET["id"]);
EOPHP

# Create delete.php
cat <<'EOPHP' > result_10th/delete.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function delete_($conn, $id_) {
    validateRequestMethod('DELETE');

    $id = isset($id_) ? (int)$id_ : 0;
    if (!$id) sendResponse(400, false, "Invalid Result ID");

    $sql = "DELETE FROM Result_10th WHERE Id = ?";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, 'i', $id);

    if (mysqli_stmt_execute($stmt)) {
        sendResponse(200, true, 'Result deleted');
    } else {
        sendResponse(500, false, 'Failed to delete result');
    }
}

//delete_($conn, $_GET["id"]);
EOPHP

# Create getByIdForUpdate.php
cat <<'EOPHP' > result_10th/getByIdForUpdate.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function getByIdForUpdate($conn, $id_) {
    $id = isset($id_) ? (int)$id_ : 0;
    if (!$id) sendResponse(400, false, "Invalid Result ID");

    $stmt = mysqli_prepare($conn, "SELECT * FROM Result_10th WHERE Id = ?");
    mysqli_stmt_bind_param($stmt, 'i', $id);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);
    if ($row = mysqli_fetch_assoc($result)) {
        sendResponse(200, true, 'Result found', $row);
    } else {
        sendResponse(404, false, 'Result not found');
    }
}

//getByIdForUpdate($conn, $_GET["get-for-update"]);
EOPHP

# Create update.php
cat <<'EOPHP' > result_10th/update.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/upload.php';
require_once '../../utility/function.php';

function update($conn) {
    validateRequestMethod('POST');
    
    $id = isset($_GET['id']) ? (int)$_GET['id'] : 0;
    if (!$id) sendResponse(400, false, "Invalid Result ID");

    $student_name = safe($conn, $_POST['Student_Name'] ?? '');
    $index_no = isset($_POST['Index_No']) ? intval($_POST['Index_No']) : null;
    $marks_percentage = safe($conn, $_POST['Marks_Percentage'] ?? '');
    $description = safe($conn, $_POST['Description'] ?? '');
    $is_active = safe($conn, $_POST['Is_Active'] ?? 'active');

    $image_path = null;

    if (!empty($_FILES['Image']['name'])) {
        $upload = upload('Image', '../../Uploads/');
        if (!$upload['success']) sendResponse(400, false, $upload['message']);
        $image_path = $upload['fileName'];
    }

    $sql = "UPDATE Result_10th SET Student_Name = ?, Index_No = ?, Image = ?, Marks_Percentage = ?, Description = ?, Is_Active = ? WHERE Id = ?";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, 'sissssi',
        $student_name, $index_no, $image_path, $marks_percentage, $description, $is_active, $id
    );
    
    if (mysqli_stmt_execute($stmt)) {
        sendResponse(201, true, 'Result updated', ['id' => $id]);
    } else {
        sendResponse(500, false, 'Failed to update result');
    }
}

//update($conn);
EOPHP

# Create result_10th.php
cat <<'EOPHP' > result_10th/result_10th.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';

switch ($_SERVER['REQUEST_METHOD']) {
    case 'GET':
        if (isset($_GET["get-for-update"])) {
            require_once './getByIdForUpdate.php';
            getByIdForUpdate($conn, $_GET["get-for-update"]);
        } elseif (isset($_GET["id"])) {
            require_once './getById.php';
            getById($conn, $_GET["id"]);
        } else {
            require_once './get.php';
            getAll($conn);
        }
        break;
    case 'POST':
        if (isset($_GET["id"])) {
            require_once './update.php';
            update($conn);
        } else {
            require_once './create.php';
            create($conn);
        }
        break;
    case 'DELETE':
        require_once './delete.php';
        delete_($conn, $_GET["id"]);
        break;
    default:
        sendResponse(405, false, 'Method Not Allowed');
        break;
}
EOPHP

echo "Result_10th API files have been set up successfully in the 'result_10th' directory."







#!/bin/bash

# Create the result_12th directory
mkdir -p result_12th

# Create create.php
cat <<'EOPHP' > result_12th/create.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/upload.php';
require_once '../../utility/function.php';

/* Important note: 
When the SQL table includes an Image, data comes as multipart/form-data. 
When there’s no image, data comes as JSON. This example handles image uploads.
*/

function create($conn) {
    validateRequestMethod('POST');
    $student_name = safe($conn, $_POST['Student_Name'] ?? '');
    $index_no = isset($_POST['Index_No']) ? intval($_POST['Index_No']) : null;
    $marks_percentage = safe($conn, $_POST['Marks_Percentage'] ?? '');
    $description = safe($conn, $_POST['Description'] ?? '');
    $is_active = safe($conn, $_POST['Is_Active'] ?? 'active');
    
    $image_path = null;

    if (!empty($_FILES['Image']['name'])) {
        $upload = upload('Image', '../../Uploads/');
        if (!$upload['success']) sendResponse(400, false, $upload['message']);
        $image_path = $upload['fileName'];
    }

    $sql = "INSERT INTO Result_12th (Student_Name, Index_No, Image, Marks_Percentage, Description, Is_Active) VALUES (?, ?, ?, ?, ?, ?)";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, 'sissss',
        $student_name, $index_no, $image_path, $marks_percentage, $description, $is_active
    );
    
    if (mysqli_stmt_execute($stmt)) {
        sendResponse(200, true, 'Result created', ['id' => mysqli_insert_id($conn)]);
    } else {
        sendResponse(500, false, 'Failed to create result');
    }
}

//create($conn);
EOPHP

# Create get.php
cat <<'EOPHP' > result_12th/get.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function buildFilters($conn) {
    $filters = [];
    if (!empty($_GET['student_name'])) {
        $filters[] = "Student_Name LIKE '%" . safe($conn, $_GET['student_name']) . "%'";
    }
    if (!empty($_GET['is_active'])) {
        $filters[] = "Is_Active = '" . safe($conn, $_GET['is_active']) . "'";
    }
    return $filters ? "WHERE " . implode(' AND ', $filters) : '';
}

function getAll($conn) {
    $filters = buildFilters($conn);
    $pagination = buildPagination();
    $sql = "SELECT * FROM Result_12th $filters ORDER BY Index_No ASC $pagination";
    $result = mysqli_query($conn, $sql);

    $rows = [];
    while ($row = mysqli_fetch_assoc($result)) {
        $rows[] = $row;
    }

    // Total count for pagination
    $count_sql = "SELECT COUNT(*) as total FROM Result_12th " . ($filters ? substr($filters, 6) : '');
    $count_result = mysqli_query($conn, $count_sql);
    $total = mysqli_fetch_assoc($count_result)['total'] ?? 0;

    sendResponse(200, true, 'Results fetched', [
        'data' => $rows,
        'pagination' => [
            'total' => $total,
            'page' => isset($_GET['page']) ? intval($_GET['page']) : 1,
            'limit' => isset($_GET['limit']) ? intval($_GET['limit']) : 10
        ]
    ]);
}

//getAll($conn);
EOPHP

# Create getById.php
cat <<'EOPHP' > result_12th/getById.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function getById($conn, $id_) {
    $id = isset($id_) ? (int)$id_ : 0;
    if (!$id) sendResponse(400, false, "Invalid Result ID");

    $stmt = mysqli_prepare($conn, "SELECT * FROM Result_12th WHERE Id = ?");
    mysqli_stmt_bind_param($stmt, 'i', $id);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);
    if ($row = mysqli_fetch_assoc($result)) {
        sendResponse(200, true, "Result found {$id_}", $row);
    } else {
        sendResponse(404, false, 'Result not found');
    }
}

//getById($conn, $_GET["id"]);
EOPHP

# Create delete.php
cat <<'EOPHP' > result_12th/delete.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function delete_($conn, $id_) {
    validateRequestMethod('DELETE');

    $id = isset($id_) ? (int)$id_ : 0;
    if (!$id) sendResponse(400, false, "Invalid Result ID");

    $sql = "DELETE FROM Result_12th WHERE Id = ?";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, 'i', $id);

    if (mysqli_stmt_execute($stmt)) {
        sendResponse(200, true, 'Result deleted');
    } else {
        sendResponse(500, false, 'Failed to delete result');
    }
}

//delete_($conn, $_GET["id"]);
EOPHP

# Create getByIdForUpdate.php
cat <<'EOPHP' > result_12th/getByIdForUpdate.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function getByIdForUpdate($conn, $id_) {
    $id = isset($id_) ? (int)$id_ : 0;
    if (!$id) sendResponse(400, false, "Invalid Result ID");

    $stmt = mysqli_prepare($conn, "SELECT * FROM Result_12th WHERE Id = ?");
    mysqli_stmt_bind_param($stmt, 'i', $id);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);
    if ($row = mysqli_fetch_assoc($result)) {
        sendResponse(200, true, 'Result found', $row);
    } else {
        sendResponse(404, false, 'Result not found');
    }
}

//getByIdForUpdate($conn, $_GET["get-for-update"]);
EOPHP

# Create update.php
cat <<'EOPHP' > result_12th/update.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/upload.php';
require_once '../../utility/function.php';

function update($conn) {
    validateRequestMethod('POST');
    
    $id = isset($_GET['id']) ? (int)$_GET['id'] : 0;
    if (!$id) sendResponse(400, false, "Invalid Result ID");

    $student_name = safe($conn, $_POST['Student_Name'] ?? '');
    $index_no = isset($_POST['Index_No']) ? intval($_POST['Index_No']) : null;
    $marks_percentage = safe($conn, $_POST['Marks_Percentage'] ?? '');
    $description = safe($conn, $_POST['Description'] ?? '');
    $is_active = safe($conn, $_POST['Is_Active'] ?? 'active');

    $image_path = null;

    if (!empty($_FILES['Image']['name'])) {
        $upload = upload('Image', '../../Uploads/');
        if (!$upload['success']) sendResponse(400, false, $upload['message']);
        $image_path = $upload['fileName'];
    }

    $sql = "UPDATE Result_12th SET Student_Name = ?, Index_No = ?, Image = ?, Marks_Percentage = ?, Description = ?, Is_Active = ? WHERE Id = ?";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, 'sissssi',
        $student_name, $index_no, $image_path, $marks_percentage, $description, $is_active, $id
    );
    
    if (mysqli_stmt_execute($stmt)) {
        sendResponse(201, true, 'Result updated', ['id' => $id]);
    } else {
        sendResponse(500, false, 'Failed to update result');
    }
}

//update($conn);
EOPHP

# Create result_12th.php
cat <<'EOPHP' > result_12th/result_12th.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';

switch ($_SERVER['REQUEST_METHOD']) {
    case 'GET':
        if (isset($_GET["get-for-update"])) {
            require_once './getByIdForUpdate.php';
            getByIdForUpdate($conn, $_GET["get-for-update"]);
        } elseif (isset($_GET["id"])) {
            require_once './getById.php';
            getById($conn, $_GET["id"]);
        } else {
            require_once './get.php';
            getAll($conn);
        }
        break;
    case 'POST':
        if (isset($_GET["id"])) {
            require_once './update.php';
            update($conn);
        } else {
            require_once './create.php';
            create($conn);
        }
        break;
    case 'DELETE':
        require_once './delete.php';
        delete_($conn, $_GET["id"]);
        break;
    default:
        sendResponse(405, false, 'Method Not Allowed');
        break;
}
EOPHP

echo "Result_12th API files have been set up successfully in the 'result_12th' directory."





#!/bin/bash

# Create the school_info directory
mkdir -p school_info

# Create create.php
cat <<'EOPHP' > school_info/create.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function create($conn) {
    validateRequestMethod('POST');
    $experience = safe($conn, $_POST['Experience'] ?? '');
    $students = isset($_POST['Students']) ? intval($_POST['Students']) : null;
    $teachers = isset($_POST['Teachers']) ? intval($_POST['Teachers']) : null;
    $awards = safe($conn, $_POST['Awards'] ?? '');
    $school_name = safe($conn, $_POST['School_Name'] ?? '');
    $short_name = safe($conn, $_POST['Short_Name'] ?? '');
    $logo_url = safe($conn, $_POST['Logo_Url'] ?? '');
    $favicon_url = safe($conn, $_POST['Favicon_Url'] ?? '');
    $motto = safe($conn, $_POST['Motto'] ?? '');
    $established_year = isset($_POST['Established_Year']) ? intval($_POST['Established_Year']) : null;
    $address = safe($conn, $_POST['Address'] ?? '');
    $city = safe($conn, $_POST['City'] ?? '');
    $state = safe($conn, $_POST['State'] ?? '');
    $pin_code = safe($conn, $_POST['Pin_Code'] ?? '');
    $alternate_phone = safe($conn, $_POST['Alternate_Phone'] ?? '');
    $email = safe($conn, $_POST['Email'] ?? '');
    $website = safe($conn, $_POST['Website'] ?? '');
    $academic_year_start = isset($_POST['Academic_Year_Start']) ? intval($_POST['Academic_Year_Start']) : null;
    $academic_year_end = isset($_POST['Academic_Year_End']) ? intval($_POST['Academic_Year_End']) : null;
    $youtube_url = safe($conn, $_POST['Youtube_Url'] ?? '');
    $linkedin_url = safe($conn, $_POST['Linkedin_Url'] ?? '');
    $instagram_url = safe($conn, $_POST['Instagram_Url'] ?? '');
    $twitter_url = safe($conn, $_POST['Twitter_Url'] ?? '');
    $board_affiliation = safe($conn, $_POST['Board_Affiliation'] ?? '');
    $board_affiliation_number = safe($conn, $_POST['Board_Affiliation_Number'] ?? '');
    $latitude = safe($conn, $_POST['Latitude'] ?? '');
    $longitude = safe($conn, $_POST['Longitude'] ?? '');
    $contact_person_name = safe($conn, $_POST['Contact_Person_Name'] ?? '');
    $contact_person_position = safe($conn, $_POST['Contact_Person_Position'] ?? '');
    $contact_person_phone = safe($conn, $_POST['Contact_Person_Phone'] ?? '');
    $medium_of_instruction = safe($conn, $_POST['Medium_Of_Instruction'] ?? '');
    $display_order = isset($_POST['Display_Order']) ? intval($_POST['Display_Order']) : null;
    $is_active = safe($conn, $_POST['Is_Active'] ?? 'active');

    $sql = "INSERT INTO School_Info (Experience, Students, Teachers, Awards, School_Name, Short_Name, Logo_Url, Favicon_Url, Motto, Established_Year, Address, City, State, Pin_Code, Alternate_Phone, Email, Website, Academic_Year_Start, Academic_Year_End, Youtube_Url, Linkedin_Url, Instagram_Url, Twitter_Url, Board_Affiliation, Board_Affiliation_Number, Latitude, Longitude, Contact_Person_Name, Contact_Person_Position, Contact_Person_Phone, Medium_Of_Instruction, Display_Order, Is_Active) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, 'siissssssisssssssiiissssssssssssis',
        $experience, $students, $teachers, $awards, $school_name, $short_name, $logo_url, $favicon_url, $motto, $established_year, $address, $city, $state, $pin_code, $alternate_phone, $email, $website, $academic_year_start, $academic_year_end, $youtube_url, $linkedin_url, $instagram_url, $twitter_url, $board_affiliation, $board_affiliation_number, $latitude, $longitude, $contact_person_name, $contact_person_position, $contact_person_phone, $medium_of_instruction, $display_order, $is_active
    );
    
    if (mysqli_stmt_execute($stmt)) {
        sendResponse(200, true, 'School Info created', ['id' => mysqli_insert_id($conn)]);
    } else {
        sendResponse(500, false, 'Failed to create school info');
    }
}

//create($conn);
EOPHP

# Create get.php
cat <<'EOPHP' > school_info/get.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function buildFilters($conn) {
    $filters = [];
    if (!empty($_GET['school_name'])) {
        $filters[] = "School_Name LIKE '%" . safe($conn, $_GET['school_name']) . "%'";
    }
    if (!empty($_GET['is_active'])) {
        $filters[] = "Is_Active = '" . safe($conn, $_GET['is_active']) . "'";
    }
    return $filters ? "WHERE " . implode(' AND ', $filters) : '';
}

function getAll($conn) {
    $filters = buildFilters($conn);
    $pagination = buildPagination();
    $sql = "SELECT * FROM School_Info $filters ORDER BY Display_Order ASC $pagination";
    $result = mysqli_query($conn, $sql);

    $rows = [];
    while ($row = mysqli_fetch_assoc($result)) {
        $rows[] = $row;
    }

    // Total count for pagination
    $count_sql = "SELECT COUNT(*) as total FROM School_Info " . ($filters ? substr($filters, 6) : '');
    $count_result = mysqli_query($conn, $count_sql);
    $total = mysqli_fetch_assoc($count_result)['total'] ?? 0;

    sendResponse(200, true, 'School Info fetched', [
        'data' => $rows,
        'pagination' => [
            'total' => $total,
            'page' => isset($_GET['page']) ? intval($_GET['page']) : 1,
            'limit' => isset($_GET['limit']) ? intval($_GET['limit']) : 10
        ]
    ]);
}

//getAll($conn);
EOPHP

# Create getById.php
cat <<'EOPHP' > school_info/getById.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function getById($conn, $id_) {
    $id = isset($id_) ? (int)$id_ : 0;
    if (!$id) sendResponse(400, false, "Invalid School Info ID");

    $stmt = mysqli_prepare($conn, "SELECT * FROM School_Info WHERE Id = ?");
    mysqli_stmt_bind_param($stmt, 'i', $id);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);
    if ($row = mysqli_fetch_assoc($result)) {
        sendResponse(200, true, "School Info found {$id_}", $row);
    } else {
        sendResponse(404, false, 'School Info not found');
    }
}

//getById($conn, $_GET["id"]);
EOPHP

# Create delete.php
cat <<'EOPHP' > school_info/delete.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function delete_($conn, $id_) {
    validateRequestMethod('DELETE');

    $id = isset($id_) ? (int)$id_ : 0;
    if (!$id) sendResponse(400, false, "Invalid School Info ID");

    $sql = "DELETE FROM School_Info WHERE Id = ?";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, 'i', $id);

    if (mysqli_stmt_execute($stmt)) {
        sendResponse(200, true, 'School Info deleted');
    } else {
        sendResponse(500, false, 'Failed to delete school info');
    }
}

//delete_($conn, $_GET["id"]);
EOPHP

# Create getByIdForUpdate.php
cat <<'EOPHP' > school_info/getByIdForUpdate.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function getByIdForUpdate($conn, $id_) {
    $id = isset($id_) ? (int)$id_ : 0;
    if (!$id) sendResponse(400, false, "Invalid School Info ID");

    $stmt = mysqli_prepare($conn, "SELECT * FROM School_Info WHERE Id = ?");
    mysqli_stmt_bind_param($stmt, 'i', $id);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);
    if ($row = mysqli_fetch_assoc($result)) {
        sendResponse(200, true, 'School Info found', $row);
    } else {
        sendResponse(404, false, 'School Info not found');
    }
}

//getByIdForUpdate($conn, $_GET["get-for-update"]);
EOPHP

# Create update.php
cat <<'EOPHP' > school_info/update.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function update($conn) {
    validateRequestMethod('POST');
    
    $id = isset($_GET['id']) ? (int)$_GET['id'] : 0;
    if (!$id) sendResponse(400, false, "Invalid School Info ID");

    $experience = safe($conn, $_POST['Experience'] ?? '');
    $students = isset($_POST['Students']) ? intval($_POST['Students']) : null;
    $teachers = isset($_POST['Teachers']) ? intval($_POST['Teachers']) : null;
    $awards = safe($conn, $_POST['Awards'] ?? '');
    $school_name = safe($conn, $_POST['School_Name'] ?? '');
    $short_name = safe($conn, $_POST['Short_Name'] ?? '');
    $logo_url = safe($conn, $_POST['Logo_Url'] ?? '');
    $favicon_url = safe($conn, $_POST['Favicon_Url'] ?? '');
    $motto = safe($conn, $_POST['Motto'] ?? '');
    $established_year = isset($_POST['Established_Year']) ? intval($_POST['Established_Year']) : null;
    $address = safe($conn, $_POST['Address'] ?? '');
    $city = safe($conn, $_POST['City'] ?? '');
    $state = safe($conn, $_POST['State'] ?? '');
    $pin_code = safe($conn, $_POST['Pin_Code'] ?? '');
    $alternate_phone = safe($conn, $_POST['Alternate_Phone'] ?? '');
    $email = safe($conn, $_POST['Email'] ?? '');
    $website = safe($conn, $_POST['Website'] ?? '');
    $academic_year_start = isset($_POST['Academic_Year_Start']) ? intval($_POST['Academic_Year_Start']) : null;
    $academic_year_end = isset($_POST['Academic_Year_End']) ? intval($_POST['Academic_Year_End']) : null;
    $youtube_url = safe($conn, $_POST['Youtube_Url'] ?? '');
    $linkedin_url = safe($conn, $_POST['Linkedin_Url'] ?? '');
    $instagram_url = safe($conn, $_POST['Instagram_Url'] ?? '');
    $twitter_url = safe($conn, $_POST['Twitter_Url'] ?? '');
    $board_affiliation = safe($conn, $_POST['Board_Affiliation'] ?? '');
    $board_affiliation_number = safe($conn, $_POST['Board_Affiliation_Number'] ?? '');
    $latitude = safe($conn, $_POST['Latitude'] ?? '');
    $longitude = safe($conn, $_POST['Longitude'] ?? '');
    $contact_person_name = safe($conn, $_POST['Contact_Person_Name'] ?? '');
    $contact_person_position = safe($conn, $_POST['Contact_Person_Position'] ?? '');
    $contact_person_phone = safe($conn, $_POST['Contact_Person_Phone'] ?? '');
    $medium_of_instruction = safe($conn, $_POST['Medium_Of_Instruction'] ?? '');
    $display_order = isset($_POST['Display_Order']) ? intval($_POST['Display_Order']) : null;
    $is_active = safe($conn, $_POST['Is_Active'] ?? 'active');

    $sql = "UPDATE School_Info SET Experience = ?, Students = ?, Teachers = ?, Awards = ?, School_Name = ?, Short_Name = ?, Logo_Url = ?, Favicon_Url = ?, Motto = ?, Established_Year = ?, Address = ?, City = ?, State = ?, Pin_Code = ?, Alternate_Phone = ?, Email = ?, Website = ?, Academic_Year_Start = ?, Academic_Year_End = ?, Youtube_Url = ?, Linkedin_Url = ?, Instagram_Url = ?, Twitter_Url = ?, Board_Affiliation = ?, Board_Affiliation_Number = ?, Latitude = ?, Longitude = ?, Contact_Person_Name = ?, Contact_Person_Position = ?, Contact_Person_Phone = ?, Medium_Of_Instruction = ?, Display_Order = ?, Is_Active = ? WHERE Id = ?";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, 'siissssssisssssssiiisssssssssssisi',
        $experience, $students, $teachers, $awards, $school_name, $short_name, $logo_url, $favicon_url, $motto, $established_year, $address, $city, $state, $pin_code, $alternate_phone, $email, $website, $academic_year_start, $academic_year_end, $youtube_url, $linkedin_url, $instagram_url, $twitter_url, $board_affiliation, $board_affiliation_number, $latitude, $longitude, $contact_person_name, $contact_person_position, $contact_person_phone, $medium_of_instruction, $display_order, $is_active, $id
    );
    
    if (mysqli_stmt_execute($stmt)) {
        sendResponse(201, true, 'School Info updated', ['id' => $id]);
    } else {
        sendResponse(500, false, 'Failed to update school info');
    }
}

//update($conn);
EOPHP

# Create school_info.php
cat <<'EOPHP' > school_info/school_info.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';

switch ($_SERVER['REQUEST_METHOD']) {
    case 'GET':
        if (isset($_GET["get-for-update"])) {
            require_once './getByIdForUpdate.php';
            getByIdForUpdate($conn, $_GET["get-for-update"]);
        } elseif (isset($_GET["id"])) {
            require_once './getById.php';
            getById($conn, $_GET["id"]);
        } else {
            require_once './get.php';
            getAll($conn);
        }
        break;
    case 'POST':
        if (isset($_GET["id"])) {
            require_once './update.php';
            update($conn);
        } else {
            require_once './create.php';
            create($conn);
        }
        break;
    case 'DELETE':
        require_once './delete.php';
        delete_($conn, $_GET["id"]);
        break;
    default:
        sendResponse(405, false, 'Method Not Allowed');
        break;
}
EOPHP

echo "School Info API files have been set up successfully in the 'school_info' directory."




#!/bin/bash

# Create the school_welcome_message directory
mkdir -p school_welcome_message

# Create create.php
cat <<'EOPHP' > school_welcome_message/create.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function create($conn) {
    validateRequestMethod('POST');
    $title = safe($conn, $_POST['Title'] ?? '');
    $message = safe($conn, $_POST['Message'] ?? '');
    $read_more_url = safe($conn, $_POST['Read_More_Url'] ?? '');
    $is_active = safe($conn, $_POST['Is_Active'] ?? 'active');

    $sql = "INSERT INTO School_Welcome_Message (Title, Message, Read_More_Url, Is_Active) VALUES (?, ?, ?, ?)";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, 'ssss',
        $title, $message, $read_more_url, $is_active
    );
    
    if (mysqli_stmt_execute($stmt)) {
        sendResponse(200, true, 'Welcome Message created', ['id' => mysqli_insert_id($conn)]);
    } else {
        sendResponse(500, false, 'Failed to create welcome message');
    }
}

//create($conn);
EOPHP

# Create get.php
cat <<'EOPHP' > school_welcome_message/get.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function buildFilters($conn) {
    $filters = [];
    if (!empty($_GET['title'])) {
        $filters[] = "Title LIKE '%" . safe($conn, $_GET['title']) . "%'";
    }
    if (!empty($_GET['is_active'])) {
        $filters[] = "Is_Active = '" . safe($conn, $_GET['is_active']) . "'";
    }
    return $filters ? "WHERE " . implode(' AND ', $filters) : '';
}

function getAll($conn) {
    $filters = buildFilters($conn);
    $pagination = buildPagination();
    $sql = "SELECT * FROM School_Welcome_Message $filters ORDER BY Created_At DESC $pagination";
    $result = mysqli_query($conn, $sql);

    $rows = [];
    while ($row = mysqli_fetch_assoc($result)) {
        $rows[] = $row;
    }

    // Total count for pagination
    $count_sql = "SELECT COUNT(*) as total FROM School_Welcome_Message " . ($filters ? substr($filters, 6) : '');
    $count_result = mysqli_query($conn, $count_sql);
    $total = mysqli_fetch_assoc($count_result)['total'] ?? 0;

    sendResponse(200, true, 'Welcome Messages fetched', [
        'data' => $rows,
        'pagination' => [
            'total' => $total,
            'page' => isset($_GET['page']) ? intval($_GET['page']) : 1,
            'limit' => isset($_GET['limit']) ? intval($_GET['limit']) : 10
        ]
    ]);
}

//getAll($conn);
EOPHP

# Create getById.php
cat <<'EOPHP' > school_welcome_message/getById.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function getById($conn, $id_) {
    $id = isset($id_) ? (int)$id_ : 0;
    if (!$id) sendResponse(400, false, "Invalid Welcome Message ID");

    $stmt = mysqli_prepare($conn, "SELECT * FROM School_Welcome_Message WHERE Id = ?");
    mysqli_stmt_bind_param($stmt, 'i', $id);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);
    if ($row = mysqli_fetch_assoc($result)) {
        sendResponse(200, true, "Welcome Message found {$id_}", $row);
    } else {
        sendResponse(404, false, 'Welcome Message not found');
    }
}

//getById($conn, $_GET["id"]);
EOPHP

# Create delete.php
cat <<'EOPHP' > school_welcome_message/delete.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function delete_($conn, $id_) {
    validateRequestMethod('DELETE');

    $id = isset($id_) ? (int)$id_ : 0;
    if (!$id) sendResponse(400, false, "Invalid Welcome Message ID");

    $sql = "DELETE FROM School_Welcome_Message WHERE Id = ?";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, 'i', $id);

    if (mysqli_stmt_execute($stmt)) {
        sendResponse(200, true, 'Welcome Message deleted');
    } else {
        sendResponse(500, false, 'Failed to delete welcome message');
    }
}

//delete_($conn, $_GET["id"]);
EOPHP

# Create getByIdForUpdate.php
cat <<'EOPHP' > school_welcome_message/getByIdForUpdate.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function getByIdForUpdate($conn, $id_) {
    $id = isset($id_) ? (int)$id_ : 0;
    if (!$id) sendResponse(400, false, "Invalid Welcome Message ID");

    $stmt = mysqli_prepare($conn, "SELECT * FROM School_Welcome_Message WHERE Id = ?");
    mysqli_stmt_bind_param($stmt, 'i', $id);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);
    if ($row = mysqli_fetch_assoc($result)) {
        sendResponse(200, true, 'Welcome Message found', $row);
    } else {
        sendResponse(404, false, 'Welcome Message not found');
    }
}

//getByIdForUpdate($conn, $_GET["get-for-update"]);
EOPHP

# Create update.php
cat <<'EOPHP' > school_welcome_message/update.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function update($conn) {
    validateRequestMethod('POST');
    
    $id = isset($_GET['id']) ? (int)$_GET['id'] : 0;
    if (!$id) sendResponse(400, false, "Invalid Welcome Message ID");

    $title = safe($conn, $_POST['Title'] ?? '');
    $message = safe($conn, $_POST['Message'] ?? '');
    $read_more_url = safe($conn, $_POST['Read_More_Url'] ?? '');
    $is_active = safe($conn, $_POST['Is_Active'] ?? 'active');

    $sql = "UPDATE School_Welcome_Message SET Title = ?, Message = ?, Read_More_Url = ?, Is_Active = ? WHERE Id = ?";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, 'ssssi',
        $title, $message, $read_more_url, $is_active, $id
    );
    
    if (mysqli_stmt_execute($stmt)) {
        sendResponse(201, true, 'Welcome Message updated', ['id' => $id]);
    } else {
        sendResponse(500, false, 'Failed to update welcome message');
    }
}

//update($conn);
EOPHP

# Create school_welcome_message.php
cat <<'EOPHP' > school_welcome_message/school_welcome_message.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';

switch ($_SERVER['REQUEST_METHOD']) {
    case 'GET':
        if (isset($_GET["get-for-update"])) {
            require_once './getByIdForUpdate.php';
            getByIdForUpdate($conn, $_GET["get-for-update"]);
        } elseif (isset($_GET["id"])) {
            require_once './getById.php';
            getById($conn, $_GET["id"]);
        } else {
            require_once './get.php';
            getAll($conn);
        }
        break;
    case 'POST':
        if (isset($_GET["id"])) {
            require_once './update.php';
            update($conn);
        } else {
            require_once './create.php';
            create($conn);
        }
        break;
    case 'DELETE':
        require_once './delete.php';
        delete_($conn, $_GET["id"]);
        break;
    default:
        sendResponse(405, false, 'Method Not Allowed');
        break;
}
EOPHP

echo "School Welcome Message API files have been set up successfully in the 'school_welcome_message' directory."





#!/bin/bash

# Create the useful_link directory
mkdir -p useful_link

# Create create.php
cat <<'EOPHP' > useful_link/create.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function create($conn) {
    validateRequestMethod('POST');
    $index_no = isset($_POST['Index_No']) ? intval($_POST['Index_No']) : null;
    $url = safe($conn, $_POST['Url'] ?? '');
    $name = safe($conn, $_POST['Name'] ?? '');
    $is_active = safe($conn, $_POST['Is_Active'] ?? 'active');

    $sql = "INSERT INTO Useful_Link (Index_No, Url, Name, Is_Active) VALUES (?, ?, ?, ?)";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, 'isss',
        $index_no, $url, $name, $is_active
    );
    
    if (mysqli_stmt_execute($stmt)) {
        sendResponse(200, true, 'Useful Link created', ['id' => mysqli_insert_id($conn)]);
    } else {
        sendResponse(500, false, 'Failed to create useful link');
    }
}

//create($conn);
EOPHP

# Create get.php
cat <<'EOPHP' > useful_link/get.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function buildFilters($conn) {
    $filters = [];
    if (!empty($_GET['name'])) {
        $filters[] = "Name LIKE '%" . safe($conn, $_GET['name']) . "%'";
    }
    if (!empty($_GET['is_active'])) {
        $filters[] = "Is_Active = '" . safe($conn, $_GET['is_active']) . "'";
    }
    return $filters ? "WHERE " . implode(' AND ', $filters) : '';
}

function getAll($conn) {
    $filters = buildFilters($conn);
    $pagination = buildPagination();
    $sql = "SELECT * FROM Useful_Link $filters ORDER BY Index_No ASC $pagination";
    $result = mysqli_query($conn, $sql);

    $rows = [];
    while ($row = mysqli_fetch_assoc($result)) {
        $rows[] = $row;
    }

    // Total count for pagination
    $count_sql = "SELECT COUNT(*) as total FROM Useful_Link " . ($filters ? substr($filters, 6) : '');
    $count_result = mysqli_query($conn, $count_sql);
    $total = mysqli_fetch_assoc($count_result)['total'] ?? 0;

    sendResponse(200, true, 'Useful Links fetched', [
        'data' => $rows,
        'pagination' => [
            'total' => $total,
            'page' => isset($_GET['page']) ? intval($_GET['page']) : 1,
            'limit' => isset($_GET['limit']) ? intval($_GET['limit']) : 10
        ]
    ]);
}

//getAll($conn);
EOPHP

# Create getById.php
cat <<'EOPHP' > useful_link/getById.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function getById($conn, $id_) {
    $id = isset($id_) ? (int)$id_ : 0;
    if (!$id) sendResponse(400, false, "Invalid Useful Link ID");

    $stmt = mysqli_prepare($conn, "SELECT * FROM Useful_Link WHERE Id = ?");
    mysqli_stmt_bind_param($stmt, 'i', $id);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);
    if ($row = mysqli_fetch_assoc($result)) {
        sendResponse(200, true, "Useful Link found {$id_}", $row);
    } else {
        sendResponse(404, false, 'Useful Link not found');
    }
}

//getById($conn, $_GET["id"]);
EOPHP

# Create delete.php
cat <<'EOPHP' > useful_link/delete.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function delete_($conn, $id_) {
    validateRequestMethod('DELETE');

    $id = isset($id_) ? (int)$id_ : 0;
    if (!$id) sendResponse(400, false, "Invalid Useful Link ID");

    $sql = "DELETE FROM Useful_Link WHERE Id = ?";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, 'i', $id);

    if (mysqli_stmt_execute($stmt)) {
        sendResponse(200, true, 'Useful Link deleted');
    } else {
        sendResponse(500, false, 'Failed to delete useful link');
    }
}

//delete_($conn, $_GET["id"]);
EOPHP

# Create getByIdForUpdate.php
cat <<'EOPHP' > useful_link/getByIdForUpdate.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function getByIdForUpdate($conn, $id_) {
    $id = isset($id_) ? (int)$id_ : 0;
    if (!$id) sendResponse(400, false, "Invalid Useful Link ID");

    $stmt = mysqli_prepare($conn, "SELECT * FROM Useful_Link WHERE Id = ?");
    mysqli_stmt_bind_param($stmt, 'i', $id);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);
    if ($row = mysqli_fetch_assoc($result)) {
        sendResponse(200, true, 'Useful Link found', $row);
    } else {
        sendResponse(404, false, 'Useful Link not found');
    }
}

//getByIdForUpdate($conn, $_GET["get-for-update"]);
EOPHP

# Create update.php
cat <<'EOPHP' > useful_link/update.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function update($conn) {
    validateRequestMethod('POST');
    
    $id = isset($_GET['id']) ? (int)$_GET['id'] : 0;
    if (!$id) sendResponse(400, false, "Invalid Useful Link ID");

    $index_no = isset($_POST['Index_No']) ? intval($_POST['Index_No']) : null;
    $url = safe($conn, $_POST['Url'] ?? '');
    $name = safe($conn, $_POST['Name'] ?? '');
    $is_active = safe($conn, $_POST['Is_Active'] ?? 'active');

    $sql = "UPDATE Useful_Link SET Index_No = ?, Url = ?, Name = ?, Is_Active = ? WHERE Id = ?";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, 'isssi',
        $index_no, $url, $name, $is_active, $id
    );
    
    if (mysqli_stmt_execute($stmt)) {
        sendResponse(201, true, 'Useful Link updated', ['id' => $id]);
    } else {
        sendResponse(500, false, 'Failed to update useful link');
    }
}

//update($conn);
EOPHP

# Create useful_link.php
cat <<'EOPHP' > useful_link/useful_link.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';

switch ($_SERVER['REQUEST_METHOD']) {
    case 'GET':
        if (isset($_GET["get-for-update"])) {
            require_once './getByIdForUpdate.php';
            getByIdForUpdate($conn, $_GET["get-for-update"]);
        } elseif (isset($_GET["id"])) {
            require_once './getById.php';
            getById($conn, $_GET["id"]);
        } else {
            require_once './get.php';
            getAll($conn);
        }
        break;
    case 'POST':
        if (isset($_GET["id"])) {
            require_once './update.php';
            update($conn);
        } else {
            require_once './create.php';
            create($conn);
        }
        break;
    case 'DELETE':
        require_once './delete.php';
        delete_($conn, $_GET["id"]);
        break;
    default:
        sendResponse(405, false, 'Method Not Allowed');
        break;
}
EOPHP

echo "Useful Link API files have been set up successfully in the 'useful_link' directory."






#!/bin/bash

# Create the achievements directory
mkdir -p achievements

# Create create.php
cat <<'EOPHP' > achievements/create.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/upload.php';
require_once '../../utility/function.php';

/* Important note: 
When the SQL table includes an Image, data comes as multipart/form-data. 
When there’s no image, data comes as JSON. This example handles image uploads.
*/

function create($conn) {
    validateRequestMethod('POST');
    $index_no = isset($_POST['Index_No']) ? intval($_POST['Index_No']) : null;
    $name = safe($conn, $_POST['Name'] ?? '');
    $title = safe($conn, $_POST['Title'] ?? '');
    $description = safe($conn, $_POST['Description'] ?? '');
    $is_active = safe($conn, $_POST['Is_Active'] ?? 'active');
    
    $image_path = null;

    if (!empty($_FILES['Image']['name'])) {
        $upload = upload('Image', '../../Uploads/');
        if (!$upload['success']) sendResponse(400, false, $upload['message']);
        $image_path = $upload['fileName'];
    }

    $sql = "INSERT INTO Achievements (Index_No, Name, Title, Description, Image, Is_Active) VALUES (?, ?, ?, ?, ?, ?)";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, 'isssss',
        $index_no, $name, $title, $description, $image_path, $is_active
    );
    
    if (mysqli_stmt_execute($stmt)) {
        sendResponse(200, true, 'Achievement created', ['id' => mysqli_insert_id($conn)]);
    } else {
        sendResponse(500, false, 'Failed to create achievement');
    }
}

//create($conn);
EOPHP

# Create get.php
cat <<'EOPHP' > achievements/get.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function buildFilters($conn) {
    $filters = [];
    if (!empty($_GET['name'])) {
        $filters[] = "Name LIKE '%" . safe($conn, $_GET['name']) . "%'";
    }
    if (!empty($_GET['title'])) {
        $filters[] = "Title LIKE '%" . safe($conn, $_GET['title']) . "%'";
    }
    if (!empty($_GET['is_active'])) {
        $filters[] = "Is_Active = '" . safe($conn, $_GET['is_active']) . "'";
    }
    return $filters ? "WHERE " . implode(' AND ', $filters) : '';
}

function getAll($conn) {
    $filters = buildFilters($conn);
    $pagination = buildPagination();
    $sql = "SELECT * FROM Achievements $filters ORDER BY Index_No ASC $pagination";
    $result = mysqli_query($conn, $sql);

    $rows = [];
    while ($row = mysqli_fetch_assoc($result)) {
        $rows[] = $row;
    }

    // Total count for pagination
    $count_sql = "SELECT COUNT(*) as total FROM Achievements " . ($filters ? substr($filters, 6) : '');
    $count_result = mysqli_query($conn, $count_sql);
    $total = mysqli_fetch_assoc($count_result)['total'] ?? 0;

    sendResponse(200, true, 'Achievements fetched', [
        'data' => $rows,
        'pagination' => [
            'total' => $total,
            'page' => isset($_GET['page']) ? intval($_GET['page']) : 1,
            'limit' => isset($_GET['limit']) ? intval($_GET['limit']) : 10
        ]
    ]);
}

//getAll($conn);
EOPHP

# Create getById.php
cat <<'EOPHP' > achievements/getById.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function getById($conn, $id_) {
    $id = isset($id_) ? (int)$id_ : 0;
    if (!$id) sendResponse(400, false, "Invalid Achievement ID");

    $stmt = mysqli_prepare($conn, "SELECT * FROM Achievements WHERE Id = ?");
    mysqli_stmt_bind_param($stmt, 'i', $id);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);
    if ($row = mysqli_fetch_assoc($result)) {
        sendResponse(200, true, "Achievement found {$id_}", $row);
    } else {
        sendResponse(404, false, 'Achievement not found');
    }
}

//getById($conn, $_GET["id"]);
EOPHP

# Create delete.php
cat <<'EOPHP' > achievements/delete.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function delete_($conn, $id_) {
    validateRequestMethod('DELETE');

    $id = isset($id_) ? (int)$id_ : 1;
    if (!$id) sendResponse(400, false, "Invalid Achievement ID");

    $sql = "DELETE FROM Achievements WHERE Id = ?";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, 'i', $id);

    if (mysqli_stmt_execute($stmt)) {
        sendResponse(200, true, 'Achievement deleted');
    } else {
        sendResponse(500, false, 'Failed to delete achievement');
    }
}

//delete_($conn, $id);
EOPHP

# Create getByIdForUpdate.php
cat <<'EOPHP' > achievements/getByIdForUpdate.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function getByIdForUpdate($conn, $id_) {
    $id = isset($id_) ? (int)$id_ : 0;
    if (!$id) sendResponse(400, false, "Invalid Achievement ID");

    $stmt = mysqli_prepare($conn, "SELECT * FROM Achievements WHERE Id = ?");
    mysqli_stmt_bind_param($stmt, 'i', $id);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);
    if ($row = mysqli_fetch_assoc($result)) {
        sendResponse(200, true, 'Achievement found', $row);
    } else {
        sendResponse(404, false, 'Achievement not found');
    }
}

//getByIdForUpdate($conn, $_GET["get-for-update"]);
EOPHP

# Create update.php
cat <<'EOPHP' > achievements/update.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/upload.php';
require_once '../../utility/function.php';

function update($conn) {
    validateRequestMethod('POST');
    
    $id = isset($_GET['id']) ? (int)$_GET['id'] : 1;
    if (!$id) sendResponse(400, false, "Invalid Achievement ID");

    $index_no = isset($_POST['Index_No']) ? intval($_POST['Index_No']) : null;
    $name = safe($conn, $_POST['Name'] ?? '');
    $title = safe($conn, $_POST['Title'] ?? '');
    $description = safe($conn, $_POST['Description'] ?? '');
    $is_active = safe($conn, $_POST['Is_Active'] ?? 'active');

    $image_path = null;

    if (!empty($_FILES['Image']['name'])) {
        $upload = upload('Image', '../../Uploads/');
        if (!$upload['success']) sendResponse(400, false, $upload['message']);
        $image_path = $upload['fileName'];
    }

    $sql = "UPDATE Achievements SET Index_No = ?, Name = ?, Title = ?, Description = ?, Image = ?, Is_Active = ? WHERE Id = ?";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, 'isssssi',
        $index_no, $name, $title, $description, $image_path, $is_active, $id
    );
    
    if (mysqli_stmt_execute($stmt)) {
        sendResponse(201, true, 'Achievement updated', ['id' => $id]);
    } else {
        sendResponse(500, false, 'Failed to update achievement');
    }
}

//update($conn);
EOPHP

# Create achievements.php
cat <<'EOPHP' > achievements/achievements.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';

switch ($_SERVER['REQUEST_METHOD']) {
    case 'GET':
        if (isset($_GET["get-for-update"])) {
            require_once './getByIdForUpdate.php';
            getByIdForUpdate($conn, $_GET["get-for-update"]);
        } elseif (isset($_GET["id"])) {
            require_once './getById.php';
            getById($conn, $_GET["id"]);
        } else {
            require_once './get.php';
            getAll($conn);
        }
        break;
    case 'POST':
        if (isset($_GET["id"])) {
            require_once './update.php';
            update($conn);
        } else {
            require_once './create.php';
            create($conn);
        }
        break;
    case 'DELETE':
        require_once './delete.php';
        delete_($conn, $_GET["id"]);
        break;
    default:
        sendResponse(405, false, 'Method Not Allowed');
        break;
}
EOPHP

echo "Achievements API files have been set up successfully in the 'achievements' directory."
EOPHP





#!/bin/bash

# Create the admission_open_message directory
mkdir -p admission_open_message

# Create create.php
cat <<'EOPHP' > admission_open_message/create.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/upload.php';
require_once '../../utility/function.php';

function create($conn) {
    validateRequestMethod('POST');
    $title = safe($conn, $_POST['Title'] ?? '');
    $index_no = isset($_POST['Index_No']) ? intval($_POST['Index_No']) : null;
    $message = safe($conn, $_POST['Message'] ?? '');
    $read_more_url = safe($conn, $_POST['Read_More_Url'] ?? '');
    $is_active = safe($conn, $_POST['Is_Active'] ?? 'active');
    
    $image_path = null;

    if (!empty($_FILES['Image']['name'])) {
        $upload = upload('Image', '../../Uploads/');
        if (!$upload['success']) sendResponse(400, false, $upload['message']);
        $image_path = $upload['fileName'];
    }

    $sql = "INSERT INTO Admission_Open_Message (Title, Index_No, Message, Image, Read_More_Url, Is_Active) VALUES (?, ?, ?, ?, ?, ?)";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, 'sisiss',
        $title, $index_no, $message, $image_path, $read_more_url, $is_active
    );
    
    if (mysqli_stmt_execute($stmt)) {
        sendResponse(200, true, 'Admission Open Message created', ['id' => mysqli_insert_id($conn)]);
    } else {
        sendResponse(500, false, 'Failed to create Admission Open Message');
    }
}

//create($conn);
EOPHP

# Create get.php
cat <<'EOPHP' > admission_open_message/get.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function buildFilters($conn) {
    $filters = [];
    if (!empty($_GET['title'])) {
        $filters[] = "Title LIKE '%" . safe($conn, $_GET['title']) . "%'";
    }
    if (!empty($_GET['is_active'])) {
        $filters[] = "Is_Active = '" . safe($conn, $_GET['is_active']) . "'";
    }
    return $filters ? "WHERE " . implode(' AND ', $filters) : '';
}

function getAll($conn) {
    $filters = buildFilters($conn);
    $pagination = buildPagination();
    $sql = "SELECT * FROM Admission_Open_Message $filters ORDER BY Index_No ASC $pagination";
    $result = mysqli_query($conn, $sql);

    $rows = [];
    while ($row = mysqli_fetch_assoc($result)) {
        $rows[] = $row;
    }

    // Total count for pagination
    $count_sql = "SELECT COUNT(*) as total FROM Admission_Open_Message " . ($filters ? substr($filters, 6) : '');
    $count_result = mysqli_query($conn, $count_sql);
    $total = mysqli_fetch_assoc($count_result)['total'] ?? 0;

    sendResponse(200, true, 'Admission Open Messages fetched', [
        'data' => $rows,
        'pagination' => [
            'total' => $total,
            'page' => isset($_GET['page']) ? intval($_GET['page']) : 1,
            'limit' => isset($_GET['limit']) ? intval($_GET['limit']) : 10
        ]
    ]);
}

//getAll($conn);
EOPHP

# Create getById.php
cat <<'EOPHP' > admission_open_message/getById.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function getById($conn, $id_) {
    $id = isset($id_) ? (int)$id_ : 0;
    if (!$id) sendResponse(400, false, "Invalid Admission Open Message ID");

    $stmt = mysqli_prepare($conn, "SELECT * FROM Admission_Open_Message WHERE Id = ?");
    mysqli_stmt_bind_param($stmt, 'i', $id);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);
    if ($row = mysqli_fetch_assoc($result)) {
        sendResponse(200, true, "Admission Open Message found {$id_}", $row);
    } else {
        sendResponse(404, false, 'Admission Open Message not found');
    }
}

//getById($conn, $_GET["id"]);
EOPHP

# Create delete.php
cat <<'EOPHP' > admission_open_message/delete.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function delete_($conn, $id_) {
    validateRequestMethod('DELETE');

    $id = isset($id_) ? (int)$id_ : 0;
    if (!$id) sendResponse(400, false, "Invalid Admission Open Message ID");

    $sql = "DELETE FROM Admission_Open_Message WHERE Id = ?";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, 'i', $id);

    if (mysqli_stmt_execute($stmt)) {
        sendResponse(200, true, 'Admission Open Message deleted');
    } else {
        sendResponse(500, false, 'Failed to delete Admission Open Message');
    }
}

//delete_($conn, $_GET["id"]);
EOPHP

# Create getByIdForUpdate.php
cat <<'EOPHP' > admission_open_message/getByIdForUpdate.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function getByIdForUpdate($conn, $id_) {
    $id = isset($id_) ? (int)$id_ : 0;
    if (!$id) sendResponse(400, false, "Invalid Admission Open Message ID");

    $stmt = mysqli_prepare($conn, "SELECT * FROM Admission_Open_Message WHERE Id = ?");
    mysqli_stmt_bind_param($stmt, 'i', $id);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);
    if ($row = mysqli_fetch_assoc($result)) {
        sendResponse(200, true, 'Admission Open Message found', $row);
    } else {
        sendResponse(404, false, 'Admission Open Message not found');
    }
}

//getByIdForUpdate($conn, $_GET["get-for-update"]);
EOPHP

# Create update.php
cat <<'EOPHP' > admission_open_message/update.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/upload.php';
require_once '../../utility/function.php';

function update($conn) {
    validateRequestMethod('POST');
    
    $id = isset($_GET['id']) ? (int)$_GET['id'] : 0;
    if (!$id) sendResponse(400, false, "Invalid Admission Open Message ID");

    $title = safe($conn, $_POST['Title'] ?? '');
    $index_no = isset($_POST['Index_No']) ? intval($_POST['Index_No']) : null;
    $message = safe($conn, $_POST['Message'] ?? '');
    $read_more_url = safe($conn, $_POST['Read_More_Url'] ?? '');
    $is_active = safe($conn, $_POST['Is_Active'] ?? 'active');

    $image_path = null;

    if (!empty($_FILES['Image']['name'])) {
        $upload = upload('Image', '../../Uploads/');
        if (!$upload['success']) sendResponse(400, false, $upload['message']);
        $image_path = $upload['fileName'];
    }

    $sql = "UPDATE Admission_Open_Message SET Title = ?, Index_No = ?, Message = ?, Image = ?, Read_More_Url = ?, Is_Active = ? WHERE Id = ?";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, 'sisissi',
        $title, $index_no, $message, $image_path, $read_more_url, $is_active, $id
    );
    
    if (mysqli_stmt_execute($stmt)) {
        sendResponse(201, true, 'Admission Open Message updated', ['id' => $id]);
    } else {
        sendResponse(500, false, 'Failed to update Admission Open Message');
    }
}

//update($conn);
EOPHP

# Create admission_open_message.php
cat <<'EOPHP' > admission_open_message/admission_open_message.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';

switch ($_SERVER['REQUEST_METHOD']) {
    case 'GET':
        if (isset($_GET["get-for-update"])) {
            require_once './getByIdForUpdate.php';
            getByIdForUpdate($conn, $_GET["get-for-update"]);
        } elseif (isset($_GET["id"])) {
            require_once './getById.php';
            getById($conn, $_GET["id"]);
        } else {
            require_once './get.php';
            getAll($conn);
        }
        break;
    case 'POST':
        if (isset($_GET["id"])) {
            require_once './update.php';
            update($conn);
        } else {
            require_once './create.php';
            create($conn);
        }
        break;
    case 'DELETE':
        require_once './delete.php';
        delete_($conn, $_GET["id"]);
        break;
    default:
        sendResponse(405, false, 'Method Not Allowed');
        break;
}
EOPHP

echo "Admission Open Message API files have been set up successfully in the
'admission_open_message' directory."




#!/bin/bash

# Create the messages directory
mkdir -p messages

# Create create.php
cat <<'EOPHP' > messages/create.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/upload.php';
require_once '../../utility/function.php';

/* Important note: 
When the SQL table includes an Image, data comes as multipart/form-data. 
When there’s no image, data comes as JSON. This example handles image uploads.
*/

function create($conn) {
    validateRequestMethod('POST');
    $name = safe($conn, $_POST['Name'] ?? '');
    $roll = safe($conn, $_POST['Roll'] ?? '');
    $description = safe($conn, $_POST['Description'] ?? '');
    $read_more_url = safe($conn, $_POST['Read_More_Url'] ?? '');
    $index_no = isset($_POST['Index_No']) ? intval($_POST['Index_No']) : null;
    $is_active = safe($conn, $_POST['Is_Active'] ?? 'active');
    
    $image_path = null;

    if (!empty($_FILES['Image']['name'])) {
        $upload = upload('Image', '../../Uploads/');
        if (!$upload['success']) sendResponse(400, false, $upload['message']);
        $image_path = $upload['fileName'];
    }

    $sql = "INSERT INTO Messages (Image, Name, Roll, Description, Read_More_Url, Index_No, Is_Active) VALUES (?, ?, ?, ?, ?, ?, ?)";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, 'sssssis',
        $image_path, $name, $roll, $description, $read_more_url, $index_no, $is_active
    );
    
    if (mysqli_stmt_execute($stmt)) {
        sendResponse(200, true, 'Message created', ['id' => mysqli_insert_id($conn)]);
    } else {
        sendResponse(500, false, 'Failed to create message');
    }
}

//create($conn);
EOPHP

# Create get.php
cat <<'EOPHP' > messages/get.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function buildFilters($conn) {
    $filters = [];
    if (!empty($_GET['name'])) {
        $filters[] = "Name LIKE '%" . safe($conn, $_GET['name']) . "%'";
    }
    if (!empty($_GET['roll'])) {
        $filters[] = "Roll LIKE '%" . safe($conn, $_GET['roll']) . "%'";
    }
    if (!empty($_GET['is_active'])) {
        $filters[] = "Is_Active = '" . safe($conn, $_GET['is_active']) . "'";
    }
    return $filters ? "WHERE " . implode(' AND ', $filters) : '';
}

function getAll($conn) {
    $filters = buildFilters($conn);
    $pagination = buildPagination();
    $sql = "SELECT * FROM Messages $filters ORDER BY Index_No ASC $pagination";
    $result = mysqli_query($conn, $sql);

    $rows = [];
    while ($row = mysqli_fetch_assoc($result)) {
        $rows[] = $row;
    }

    // Total count for pagination
    $count_sql = "SELECT COUNT(*) as total FROM Messages " . ($filters ? substr($filters, 6) : '');
    $count_result = mysqli_query($conn, $count_sql);
    $total = mysqli_fetch_assoc($count_result)['total'] ?? 0;

    sendResponse(200, true, 'Messages fetched', [
        'data' => $rows,
        'pagination' => [
            'total' => $total,
            'page' => isset($_GET['page']) ? intval($_GET['page']) : 1,
            'limit' => isset($_GET['limit']) ? intval($_GET['limit']) : 10
        ]
    ]);
}

//getAll($conn);
EOPHP

# Create getById.php
cat <<'EOPHP' > messages/getById.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function getById($conn, $id_) {
    $id = isset($id_) ? (int)$id_ : 0;
    if (!$id) sendResponse(400, false, "Invalid Message ID");

    $stmt = mysqli_prepare($conn, "SELECT * FROM Messages WHERE Id = ?");
    mysqli_stmt_bind_param($stmt, 'i', $id);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);
    if ($row = mysqli_fetch_assoc($result)) {
        sendResponse(200, true, "Message found {$id_}", $row);
    } else {
        sendResponse(404, false, 'Message not found');
    }
}

//getById($conn, $_GET["id"]);
EOPHP

# Create delete.php
cat <<'EOPHP' > messages/delete.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function delete_($conn, $id_) {
    validateRequestMethod('DELETE');

    $id = isset($id_) ? (int)$id_ : 0;
    if (!$id) sendResponse(400, false, "Invalid Message ID");

    $sql = "DELETE FROM Messages WHERE Id = ?";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, 'i', $id);

    if (mysqli_stmt_execute($stmt)) {
        sendResponse(200, true, 'Message deleted');
    } else {
        sendResponse(500, false, 'Failed to delete message');
    }
}

//delete_($conn, $_GET["id"]);
EOPHP

# Create getByIdForUpdate.php
cat <<'EOPHP' > messages/getByIdForUpdate.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function getByIdForUpdate($conn, $id_) {
    $id = isset($id_) ? (int)$id_ : 0;
    if (!$id) sendResponse(400, false, "Invalid Message ID");

    $stmt = mysqli_prepare($conn, "SELECT * FROM Messages WHERE Id = ?");
    mysqli_stmt_bind_param($stmt, 'i', $id);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);
    if ($row = mysqli_fetch_assoc($result)) {
        sendResponse(200, true, 'Message found', $row);
    } else {
        sendResponse(404, false, 'Message not found');
    }
}

//getByIdForUpdate($conn, $_GET["get-for-update"]);
EOPHP

# Create update.php
cat <<'EOPHP' > messages/update.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/upload.php';
require_once '../../utility/function.php';

function update($conn) {
    validateRequestMethod('POST');
    
    $id = isset($_GET['id']) ? (int)$_GET['id'] : 0;
    if (!$id) sendResponse(400, false, "Invalid Message ID");

    $name = safe($conn, $_POST['Name'] ?? '');
    $roll = safe($conn, $_POST['Roll'] ?? '');
    $description = safe($conn, $_POST['Description'] ?? '');
    $read_more_url = safe($conn, $_POST['Read_More_Url'] ?? '');
    $index_no = isset($_POST['Index_No']) ? intval($_POST['Index_No']) : null;
    $is_active = safe($conn, $_POST['Is_Active'] ?? 'active');

    $image_path = null;

    if (!empty($_FILES['Image']['name'])) {
        $upload = upload('Image', '../../Uploads/');
        if (!$upload['success']) sendResponse(400, false, $upload['message']);
        $image_path = $upload['fileName'];
    }

    $sql = "UPDATE Messages SET Image = ?, Name = ?, Roll = ?, Description = ?, Read_More_Url = ?, Index_No = ?, Is_Active = ? WHERE Id = ?";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, 'sssssisi',
        $image_path, $name, $roll, $description, $read_more_url, $index_no, $is_active, $id
    );
    
    if (mysqli_stmt_execute($stmt)) {
        sendResponse(201, true, 'Message updated', ['id' => $id]);
    } else {
        sendResponse(500, false, 'Failed to update message');
    }
}

//update($conn);
EOPHP

# Create messages.php
cat <<'EOPHP' > messages/messages.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';

switch ($_SERVER['REQUEST_METHOD']) {
    case 'GET':
        if (isset($_GET["get-for-update"])) {
            require_once './getByIdForUpdate.php';
            getByIdForUpdate($conn, $_GET["get-for-update"]);
        } elseif (isset($_GET["id"])) {
            require_once './getById.php';
            getById($conn, $_GET["id"]);
        } else {
            require_once './get.php';
            getAll($conn);
        }
        break;
    case 'POST':
        if (isset($_GET["id"])) {
            require_once './update.php';
            update($conn);
        } else {
            require_once './create.php';
            create($conn);
        }
        break;
    case 'DELETE':
        require_once './delete.php';
        delete_($conn, $_GET["id"]);
        break;
    default:
        sendResponse(405, false, 'Method Not Allowed');
        break;
}
EOPHP

echo "Messages API files have been set up successfully in the 'messages' directory."





#!/bin/bash

# Create the gallery_category directory
mkdir -p gallery_category

# Create create.php
cat <<'EOPHP' > gallery_category/create.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function create($conn) {
    validateRequestMethod('POST');
    $name = safe($conn, $_POST['Name'] ?? '');
    $title = safe($conn, $_POST['Title'] ?? '');
    $index_no = isset($_POST['Index_No']) ? intval($_POST['Index_No']) : null;
    $date = safe($conn, $_POST['Date'] ?? '');
    $is_active = safe($conn, $_POST['Is_Active'] ?? 'active');

    $sql = "INSERT INTO Gallery_Category (Name, Title, Index_No, Date, Is_Active) VALUES (?, ?, ?, ?, ?)";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, 'ssiss',
        $name, $title, $index_no, $date, $is_active
    );
    
    if (mysqli_stmt_execute($stmt)) {
        sendResponse(200, true, 'Gallery Category created', ['id' => mysqli_insert_id($conn)]);
    } else {
        sendResponse(500, false, 'Failed to create gallery category');
    }
}

//create($conn);
EOPHP

# Create get.php
cat <<'EOPHP' > gallery_category/get.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function buildFilters($conn) {
    $filters = [];
    if (!empty($_GET['name'])) {
        $filters[] = "Name LIKE '%" . safe($conn, $_GET['name']) . "%'";
    }
    if (!empty($_GET['title'])) {
        $filters[] = "Title LIKE '%" . safe($conn, $_GET['title']) . "%'";
    }
    if (!empty($_GET['is_active'])) {
        $filters[] = "Is_Active = '" . safe($conn, $_GET['is_active']) . "'";
    }
    return $filters ? "WHERE " . implode(' AND ', $filters) : '';
}

function getAll($conn) {
    $filters = buildFilters($conn);
    $pagination = buildPagination();
    $sql = "SELECT * FROM Gallery_Category $filters ORDER BY Index_No ASC $pagination";
    $result = mysqli_query($conn, $sql);

    $rows = [];
    while ($row = mysqli_fetch_assoc($result)) {
        $rows[] = $row;
    }

    // Total count for pagination
    $count_sql = "SELECT COUNT(*) as total FROM Gallery_Category " . ($filters ? substr($filters, 6) : '');
    $count_result = mysqli_query($conn, $count_sql);
    $total = mysqli_fetch_assoc($count_result)['total'] ?? 0;

    sendResponse(200, true, 'Gallery Categories fetched', [
        'data' => $rows,
        'pagination' => [
            'total' => $total,
            'page' => isset($_GET['page']) ? intval($_GET['page']) : 1,
            'limit' => isset($_GET['limit']) ? intval($_GET['limit']) : 10
        ]
    ]);
}

//getAll($conn);
EOPHP

# Create getById.php
cat <<'EOPHP' > gallery_category/getById.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function getById($conn, $id_) {
    $id = isset($id_) ? (int)$id_ : 0;
    if (!$id) sendResponse(400, false, "Invalid Gallery Category ID");

    $stmt = mysqli_prepare($conn, "SELECT * FROM Gallery_Category WHERE Id = ?");
    mysqli_stmt_bind_param($stmt, 'i', $id);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);
    if ($row = mysqli_fetch_assoc($result)) {
        sendResponse(200, true, "Gallery Category found {$id_}", $row);
    } else {
        sendResponse(404, false, 'Gallery Category not found');
    }
}

//getById($conn, $_GET["id"]);
EOPHP

# Create delete.php
cat <<'EOPHP' > gallery_category/delete.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function delete_($conn, $id_) {
    validateRequestMethod('DELETE');

    $id = isset($id_) ? (int)$id_ : 0;
    if (!$id) sendResponse(400, false, "Invalid Gallery Category ID");

    $sql = "DELETE FROM Gallery_Category WHERE Id = ?";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, 'i', $id);

    if (mysqli_stmt_execute($stmt)) {
        sendResponse(200, true, 'Gallery Category deleted');
    } else {
        sendResponse(500, false, 'Failed to delete gallery category');
    }
}

//delete_($conn, $_GET["id"]);
EOPHP

# Create getByIdForUpdate.php
cat <<'EOPHP' > gallery_category/getByIdForUpdate.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function getByIdForUpdate($conn, $id_) {
    $id = isset($id_) ? (int)$id_ : 0;
    if (!$id) sendResponse(400, false, "Invalid Gallery Category ID");

    $stmt = mysqli_prepare($conn, "SELECT * FROM Gallery_Category WHERE Id = ?");
    mysqli_stmt_bind_param($stmt, 'i', $id);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);
    if ($row = mysqli_fetch_assoc($result)) {
        sendResponse(200, true, 'Gallery Category found', $row);
    } else {
        sendResponse(404, false, 'Gallery Category not found');
    }
}

//getByIdForUpdate($conn, $_GET["get-for-update"]);
EOPHP

# Create update.php
cat <<'EOPHP' > gallery_category/update.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function update($conn) {
    validateRequestMethod('POST');
    
    $id = isset($_GET['id']) ? (int)$_GET['id'] : 0;
    if (!$id) sendResponse(400, false, "Invalid Gallery Category ID");

    $name = safe($conn, $_POST['Name'] ?? '');
    $title = safe($conn, $_POST['Title'] ?? '');
    $index_no = isset($_POST['Index_No']) ? intval($_POST['Index_No']) : null;
    $date = safe($conn, $_POST['Date'] ?? '');
    $is_active = safe($conn, $_POST['Is_Active'] ?? 'active');

    $sql = "UPDATE Gallery_Category SET Name = ?, Title = ?, Index_No = ?, Date = ?, Is_Active = ? WHERE Id = ?";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, 'ssissi',
        $name, $title, $index_no, $date, $is_active, $id
    );
    
    if (mysqli_stmt_execute($stmt)) {
        sendResponse(201, true, 'Gallery Category updated', ['id' => $id]);
    } else {
        sendResponse(500, false, 'Failed to update gallery category');
    }
}

//update($conn);
EOPHP

# Create gallery_category.php
cat <<'EOPHP' > gallery_category/gallery_category.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';

switch ($_SERVER['REQUEST_METHOD']) {
    case 'GET':
        if (isset($_GET["get-for-update"])) {
            require_once './getByIdForUpdate.php';
            getByIdForUpdate($conn, $_GET["get-for-update"]);
        } elseif (isset($_GET["id"])) {
            require_once './getById.php';
            getById($conn, $_GET["id"]);
        } else {
            require_once './get.php';
            getAll($conn);
        }
        break;
    case 'POST':
        if (isset($_GET["id"])) {
            require_once './update.php';
            update($conn);
        } else {
            require_once './create.php';
            create($conn);
        }
        break;
    case 'DELETE':
        require_once './delete.php';
        delete_($conn, $_GET["id"]);
        break;
    default:
        sendResponse(405, false, 'Method Not Allowed');
        break;
}
EOPHP

echo "Gallery Category API files have been set up successfully in the
'gallery_category' directory."




#!/bin/bash

# Create the gallery directory
mkdir -p gallery

# Create create.php
cat <<'EOPHP' > gallery/create.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/upload.php';
require_once '../../utility/function.php';

/* Important note: 
When the SQL table includes an Image, data comes as multipart/form-data. 
When there’s no image, data comes as JSON. This example handles image uploads.
*/

function create($conn) {
    validateRequestMethod('POST');
    $gallery_category_id = isset($_POST['Gallery_Category_Id']) ? intval($_POST['Gallery_Category_Id']) : null;
    $description = safe($conn, $_POST['Description'] ?? '');
    $is_active = safe($conn, $_POST['Is_Active'] ?? 'active');
    
    $image_path = null;

    if (!empty($_FILES['Image']['name'])) {
        $upload = upload('Image', '../../Uploads/');
        if (!$upload['success']) sendResponse(400, false, $upload['message']);
        $image_path = $upload['fileName'];
    }

    $sql = "INSERT INTO Gallery (Gallery_Category_Id, Image, Description, Is_Active) VALUES (?, ?, ?, ?)";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, 'isss',
        $gallery_category_id, $image_path, $description, $is_active
    );
    
    if (mysqli_stmt_execute($stmt)) {
        sendResponse(200, true, 'Gallery created', ['id' => mysqli_insert_id($conn)]);
    } else {
        sendResponse(500, false, 'Failed to create gallery');
    }
}

//create($conn);
EOPHP

# Create get.php
cat <<'EOPHP' > gallery/get.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function buildFilters($conn) {
    $filters = [];
    if (!empty($_GET['gallery_category_id'])) {
        $filters[] = "Gallery_Category_Id = '" . safe($conn, $_GET['gallery_category_id']) . "'";
    }
    if (!empty($_GET['is_active'])) {
        $filters[] = "Is_Active = '" . safe($conn, $_GET['is_active']) . "'";
    }
    return $filters ? "WHERE " . implode(' AND ', $filters) : '';
}

function getAll($conn) {
    $filters = buildFilters($conn);
    $pagination = buildPagination();
    $sql = "SELECT * FROM Gallery $filters ORDER BY Created_At DESC $pagination";
    $result = mysqli_query($conn, $sql);

    $rows = [];
    while ($row = mysqli_fetch_assoc($result)) {
        $rows[] = $row;
    }

    // Total count for pagination
    $count_sql = "SELECT COUNT(*) as total FROM Gallery " . ($filters ? substr($filters, 6) : '');
    $count_result = mysqli_query($conn, $count_sql);
    $total = mysqli_fetch_assoc($count_result)['total'] ?? 0;

    sendResponse(200, true, 'Gallery items fetched', [
        'data' => $rows,
        'pagination' => [
            'total' => $total,
            'page' => isset($_GET['page']) ? intval($_GET['page']) : 1,
            'limit' => isset($_GET['limit']) ? intval($_GET['limit']) : 10
        ]
    ]);
}

//getAll($conn);
EOPHP

# Create getById.php
cat <<'EOPHP' > gallery/getById.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function getById($conn, $id_) {
    $id = isset($id_) ? (int)$id_ : 0;
    if (!$id) sendResponse(400, false, "Invalid Gallery ID");

    $stmt = mysqli_prepare($conn, "SELECT * FROM Gallery WHERE Id = ?");
    mysqli_stmt_bind_param($stmt, 'i', $id);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);
    if ($row = mysqli_fetch_assoc($result)) {
        sendResponse(200, true, "Gallery item found {$id_}", $row);
    } else {
        sendResponse(404, false, 'Gallery item not found');
    }
}

//getById($conn, $_GET["id"]);
EOPHP

# Create delete.php
cat <<'EOPHP' > gallery/delete.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function delete_($conn, $id_) {
    validateRequestMethod('DELETE');

    $id = isset($id_) ? (int)$id_ : 0;
    if (!$id) sendResponse(400, false, "Invalid Gallery ID");

    $sql = "DELETE FROM Gallery WHERE Id = ?";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, 'i', $id);

    if (mysqli_stmt_execute($stmt)) {
        sendResponse(200, true, 'Gallery item deleted');
    } else {
        sendResponse(500, false, 'Failed to delete gallery item');
    }
}

//delete_($conn, $_GET["id"]);
EOPHP

# Create getByIdForUpdate.php
cat <<'EOPHP' > gallery/getByIdForUpdate.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function getByIdForUpdate($conn, $id_) {
    $id = isset($id_) ? (int)$id_ : 0;
    if (!$id) sendResponse(400, false, "Invalid Gallery ID");

    $stmt = mysqli_prepare($conn, "SELECT * FROM Gallery WHERE Id = ?");
    mysqli_stmt_bind_param($stmt, 'i', $id);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);
    if ($row = mysqli_fetch_assoc($result)) {
        sendResponse(200, true, 'Gallery item found', $row);
    } else {
        sendResponse(404, false, 'Gallery item not found');
    }
}

//getByIdForUpdate($conn, $_GET["get-for-update"]);
EOPHP

# Create update.php
cat <<'EOPHP' > gallery/update.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/upload.php';
require_once '../../utility/function.php';

function update($conn) {
    validateRequestMethod('POST');
    
    $id = isset($_GET['id']) ? (int)$_GET['id'] : 0;
    if (!$id) sendResponse(400, false, "Invalid Gallery ID");

    $gallery_category_id = isset($_POST['Gallery_Category_Id']) ? intval($_POST['Gallery_Category_Id']) : null;
    $description = safe($conn, $_POST['Description'] ?? '');
    $is_active = safe($conn, $_POST['Is_Active'] ?? 'active');

    $image_path = null;

    if (!empty($_FILES['Image']['name'])) {
        $upload = upload('Image', '../../Uploads/');
        if (!$upload['success']) sendResponse(400, false, $upload['message']);
        $image_path = $upload['fileName'];
    }

    $sql = "UPDATE Gallery SET Gallery_Category_Id = ?, Image = ?, Description = ?, Is_Active = ? WHERE Id = ?";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, 'isssi',
        $gallery_category_id, $image_path, $description, $is_active, $id
    );
    
    if (mysqli_stmt_execute($stmt)) {
        sendResponse(201, true, 'Gallery item updated', ['id' => $id]);
    } else {
        sendResponse(500, false, 'Failed to update gallery item');
    }
}

//update($conn);
EOPHP

# Create gallery.php
cat <<'EOPHP' > gallery/gallery.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';

switch ($_SERVER['REQUEST_METHOD']) {
    case 'GET':
        if (isset($_GET["get-for-update"])) {
            require_once './getByIdForUpdate.php';
            getByIdForUpdate($conn, $_GET["get-for-update"]);
        } elseif (isset($_GET["id"])) {
            require_once './getById.php';
            getById($conn, $_GET["id"]);
        } else {
            require_once './get.php';
            getAll($conn);
        }
        break;
    case 'POST':
        if (isset($_GET["id"])) {
            require_once './update.php';
            update($conn);
        } else {
            require_once './create.php';
            create($conn);
        }
        break;
    case 'DELETE':
        require_once './delete.php';
        delete_($conn, $_GET["id"]);
        break;
    default:
        sendResponse(405, false, 'Method Not Allowed');
        break;
}
EOPHP

echo "Gallery API files have been set up successfully in the 'gallery' directory."



#!/bin/bash

# Create the facility directory
mkdir -p facility

# Create create.php
cat <<'EOPHP' > facility/create.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/upload.php';
require_once '../../utility/function.php';

/* Important note: 
When the SQL table includes an Image, data comes as multipart/form-data. 
When there’s no image, data comes as JSON. This example handles image uploads.
*/

function create($conn) {
    validateRequestMethod('POST');
    $index_no = isset($_POST['Index_No']) ? intval($_POST['Index_No']) : null;
    $name = safe($conn, $_POST['Name'] ?? '');
    $title = safe($conn, $_POST['Title'] ?? '');
    $description = safe($conn, $_POST['Description'] ?? '');
    $is_active = safe($conn, $_POST['Is_Active'] ?? 'active');
    
    $image_path = null;

    if (!empty($_FILES['Image']['name'])) {
        $upload = upload('Image', '../../Uploads/');
        if (!$upload['success']) sendResponse(400, false, $upload['message']);
        $image_path = $upload['fileName'];
    }

    $sql = "INSERT INTO Facility (Index_No, Name, Title, Description, Image, Is_Active) VALUES (?, ?, ?, ?, ?, ?)";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, 'isssss',
        $index_no, $name, $title, $description, $image_path, $is_active
    );
    
    if (mysqli_stmt_execute($stmt)) {
        sendResponse(200, true, 'Facility created', ['id' => mysqli_insert_id($conn)]);
    } else {
        sendResponse(500, false, 'Failed to create facility');
    }
}

//create($conn);
EOPHP

# Create get.php
cat <<'EOPHP' > facility/get.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function buildFilters($conn) {
    $filters = [];
    if (!empty($_GET['name'])) {
        $filters[] = "Name LIKE '%" . safe($conn, $_GET['name']) . "%'";
    }
    if (!empty($_GET['title'])) {
        $filters[] = "Title LIKE '%" . safe($conn, $_GET['title']) . "%'";
    }
    if (!empty($_GET['is_active'])) {
        $filters[] = "Is_Active = '" . safe($conn, $_GET['is_active']) . "'";
    }
    return $filters ? "WHERE " . implode(' AND ', $filters) : '';
}

function getAll($conn) {
    $filters = buildFilters($conn);
    $pagination = buildPagination();
    $sql = "SELECT * FROM Facility $filters ORDER BY Index_No ASC $pagination";
    $result = mysqli_query($conn, $sql);

    $rows = [];
    while ($row = mysqli_fetch_assoc($result)) {
        $rows[] = $row;
    }

    // Total count for pagination
    $count_sql = "SELECT COUNT(*) as total FROM Facility " . ($filters ? substr($filters, 6) : '');
    $count_result = mysqli_query($conn, $count_sql);
    $total = mysqli_fetch_assoc($count_result)['total'] ?? 0;

    sendResponse(200, true, 'Facilities fetched', [
        'data' => $rows,
        'pagination' => [
            'total' => $total,
            'page' => isset($_GET['page']) ? intval($_GET['page']) : 1,
            'limit' => isset($_GET['limit']) ? intval($_GET['limit']) : 10
        ]
    ]);
}

//getAll($conn);
EOPHP

# Create getById.php
cat <<'EOPHP' > facility/getById.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function getById($conn, $id_) {
    $id = isset($id_) ? (int)$id_ : 0;
    if (!$id) sendResponse(400, false, "Invalid Facility ID");

    $stmt = mysqli_prepare($conn, "SELECT * FROM Facility WHERE Id = ?");
    mysqli_stmt_bind_param($stmt, 'i', $id);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);
    if ($row = mysqli_fetch_assoc($result)) {
        sendResponse(200, true, "Facility found {$id_}", $row);
    } else {
        sendResponse(404, false, 'Facility not found');
    }
}

//getById($conn, $_GET["id"]);
EOPHP

# Create delete.php
cat <<'EOPHP' > facility/delete.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function delete_($conn, $id_) {
    validateRequestMethod('DELETE');

    $id = isset($id_) ? (int)$id_ : 0;
    if (!$id) sendResponse(400, false, "Invalid Facility ID");

    $sql = "DELETE FROM Facility WHERE Id = ?";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, 'i', $id);

    if (mysqli_stmt_execute($stmt)) {
        sendResponse(200, true, 'Facility deleted');
    } else {
        sendResponse(500, false, 'Failed to delete facility');
    }
}

//delete_($conn, $_GET["id"]);
EOPHP

# Create getByIdForUpdate.php
cat <<'EOPHP' > facility/getByIdForUpdate.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function getByIdForUpdate($conn, $id_) {
    $id = isset($id_) ? (int)$id_ : 0;
    if (!$id) sendResponse(400, false, "Invalid Facility ID");

    $stmt = mysqli_prepare($conn, "SELECT * FROM Facility WHERE Id = ?");
    mysqli_stmt_bind_param($stmt, 'i', $id);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);
    if ($row = mysqli_fetch_assoc($result)) {
        sendResponse(200, true, 'Facility found', $row);
    } else {
        sendResponse(404, false, 'Facility not found');
    }
}

//getByIdForUpdate($conn, $_GET["get-for-update"]);
EOPHP

# Create update.php
cat <<'EOPHP' > facility/update.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/upload.php';
require_once '../../utility/function.php';

function update($conn) {
    validateRequestMethod('POST');
    
    $id = isset($_GET['id']) ? (int)$_GET['id'] : 0;
    if (!$id) sendResponse(400, false, "Invalid Facility ID");

    $index_no = isset($_POST['Index_No']) ? intval($_POST['Index_No']) : null;
    $name = safe($conn, $_POST['Name'] ?? '');
    $title = safe($conn, $_POST['Title'] ?? '');
    $description = safe($conn, $_POST['Description'] ?? '');
    $is_active = safe($conn, $_POST['Is_Active'] ?? 'active');

    $image_path = null;

    if (!empty($_FILES['Image']['name'])) {
        $upload = upload('Image', '../../Uploads/');
        if (!$upload['success']) sendResponse(400, false, $upload['message']);
        $image_path = $upload['fileName'];
    }

    $sql = "UPDATE Facility SET Index_No = ?, Name = ?, Title = ?, Description = ?, Image = ?, Is_Active = ? WHERE Id = ?";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, 'isssssi',
        $index_no, $name, $title, $description, $image_path, $is_active, $id
    );
    
    if (mysqli_stmt_execute($stmt)) {
        sendResponse(201, true, 'Facility updated', ['id' => $id]);
    } else {
        sendResponse(500, false, 'Failed to update facility');
    }
}

//update($conn);
EOPHP

# Create facility.php
cat <<'EOPHP' > facility/facility.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';

switch ($_SERVER['REQUEST_METHOD']) {
    case 'GET':
        if (isset($_GET["get-for-update"])) {
            require_once './getByIdForUpdate.php';
            getByIdForUpdate($conn, $_GET["get-for-update"]);
        } elseif (isset($_GET["id"])) {
            require_once './getById.php';
            getById($conn, $_GET["id"]);
        } else {
            require_once './get.php';
            getAll($conn);
        }
        break;
    case 'POST':
        if (isset($_GET["id"])) {
            require_once './update.php';
            update($conn);
        } else {
            require_once './create.php';
            create($conn);
        }
        break;
    case 'DELETE':
        require_once './delete.php';
        delete_($conn, $_GET["id"]);
        break;
    default:
        sendResponse(405, false, 'Method Not Allowed');
        break;
}
EOPHP

echo "Facility API files have been set up successfully in the 'facility' directory."






#!/bin/bash

# Create the blog directory
mkdir -p blog

# Create create.php
cat <<'EOPHP' > blog/create.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/upload.php';
require_once '../../utility/function.php';

/* Important note: 
When the SQL table includes an Image, data comes as multipart/form-data. 
When there’s no image, data comes as JSON. This example handles image uploads.
*/

function create($conn) {
    validateRequestMethod('POST');
    $name = safe($conn, $_POST['Name'] ?? '');
    $title = safe($conn, $_POST['Title'] ?? '');
    $description = safe($conn, $_POST['Description'] ?? '');
    $date = safe($conn, $_POST['Date'] ?? '');
    $content = safe($conn, $_POST['Content'] ?? '');
    $author = safe($conn, $_POST['Author'] ?? '');
    
    $image_path = null;

    if (!empty($_FILES['Image']['name'])) {
        $upload = upload('Image', '../../uploads/');
        if (!$upload['success']) sendResponse(400, false, $upload['message']);
        $image_path = $upload['fileName'];
    }

    $sql = "INSERT INTO Blog (Name, Title, Description, Date, Content, Author, Image) VALUES (?, ?, ?, ?, ?, ?, ?)";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, 'sssssss',
        $name, $title, $description, $date, $content, $author, $image_path
    );
    
    if (mysqli_stmt_execute($stmt)) {
        sendResponse(200, true, 'Blog created', ['id' => mysqli_insert_id($conn)]);
    } else {
        sendResponse(500, false, 'Failed to create blog');
    }
}

//create($conn);
EOPHP

# Create get.php
cat <<'EOPHP' > blog/get.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function buildFilters($conn) {
    $filters = [];
    if (!empty($_GET['title'])) {
        $filters[] = "Title LIKE '%" . safe($conn, $_GET['title']) . "%'";
    }
    if (!empty($_GET['author'])) {
        $filters[] = "Author LIKE '%" . safe($conn, $_GET['author']) . "%'";
    }
    return $filters ? "WHERE " . implode(' AND ', $filters) : '';
}

function getAll($conn) {
    $filters = buildFilters($conn);
    $pagination = buildPagination();
    $sql = "SELECT * FROM Blog $filters ORDER BY Created_At DESC $pagination";
    $result = mysqli_query($conn, $sql);

    $rows = [];
    while ($row = mysqli_fetch_assoc($result)) {
        $rows[] = $row;
    }

    // Total count for pagination
    $count_sql = "SELECT COUNT(*) as total FROM Blog " . ($filters ? substr($filters, 6) : '');
    $count_result = mysqli_query($conn, $count_sql);
    $total = mysqli_fetch_assoc($count_result)['total'] ?? 0;

    sendResponse(200, true, 'Blogs fetched', [
        'data' => $rows,
        'pagination' => [
            'total' => $total,
            'page' => isset($_GET['page']) ? intval($_GET['page']) : 1,
            'limit' => isset($_GET['limit']) ? intval($_GET['limit']) : 10
        ]
    ]);
}

//getAll($conn);
EOPHP

# Create getById.php
cat <<'EOPHP' > blog/getById.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function getById($conn, $id_) {
    $id = isset($id_) ? (int)$id_ : 0;
    if (!$id) sendResponse(400, false, "Invalid Blog ID");

    $stmt = mysqli_prepare($conn, "SELECT * FROM Blog WHERE Id = ?");
    mysqli_stmt_bind_param($stmt, 'i', $id);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);
    if ($row = mysqli_fetch_assoc($result)) {
        sendResponse(200, true, "Blog found {$id_}", $row);
    } else {
        sendResponse(404, false, 'Blog not found');
    }
}

//getById($conn, $_GET["id"]);
EOPHP

# Create delete.php
cat <<'EOPHP' > blog/delete.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function delete_($conn, $id_) {
    validateRequestMethod('DELETE');

    $id = isset($id_) ? (int)$id_ : 0;
    if (!$id) sendResponse(400, false, "Invalid Blog ID");

    $sql = "DELETE FROM Blog WHERE Id = ?";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, 'i', $id);

    if (mysqli_stmt_execute($stmt)) {
        sendResponse(200, true, 'Blog deleted');
    } else {
        sendResponse(500, false, 'Failed to delete blog');
    }
}

//delete_($conn, $_GET["id"]);
EOPHP

# Create getByIdForUpdate.php
cat <<'EOPHP' > blog/getByIdForUpdate.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/function.php';

function getByIdForUpdate($conn, $id_) {
    $id = isset($id_) ? (int)$id_ : 0;
    if (!$id) sendResponse(400, false, "Invalid Blog ID");

    $stmt = mysqli_prepare($conn, "SELECT * FROM Blog WHERE Id = ?");
    mysqli_stmt_bind_param($stmt, 'i', $id);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);
    if ($row = mysqli_fetch_assoc($result)) {
        sendResponse(200, true, 'Blog found', $row);
    } else {
        sendResponse(404, false, 'Blog not found');
    }
}

//getByIdForUpdate($conn, $_GET["get-for-update"]);
EOPHP

# Create update.php
cat <<'EOPHP' > blog/update.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';
require_once '../../utility/upload.php';
require_once '../../utility/function.php';

function update($conn) {
    validateRequestMethod('POST');
    
    $id = isset($_GET['id']) ? (int)$_GET['id'] : 0;
    if (!$id) sendResponse(400, false, "Invalid Blog ID");

    $set_clauses = [];
    $params = [];

    if (isset($_POST['Name'])) {
        $set_clauses[] = "Name = ?";
        $params[] = safe($conn, $_POST['Name']);
    }
    if (isset($_POST['Title'])) {
        $set_clauses[] = "Title = ?";
        $params[] = safe($conn, $_POST['Title']);
    }
    if (isset($_POST['Description'])) {
        $set_clauses[] = "Description = ?";
        $params[] = safe($conn, $_POST['Description']);
    }
    if (isset($_POST['Date'])) {
        $set_clauses[] = "Date = ?";
        $params[] = safe($conn, $_POST['Date']);
    }
    if (isset($_POST['Content'])) {
        $set_clauses[] = "Content = ?";
        $params[] = safe($conn, $_POST['Content']);
    }
    if (isset($_POST['Author'])) {
        $set_clauses[] = "Author = ?";
        $params[] = safe($conn, $_POST['Author']);
    }

    if (!empty($_FILES['Image']['name'])) {
        $upload = upload('Image', '../../uploads/');
        if (!$upload['success']) sendResponse(400, false, $upload['message']);
        $set_clauses[] = "Image = ?";
        $params[] = $upload['fileName'];
    }

    if (empty($set_clauses)) {
        sendResponse(400, false, 'No fields to update');
    }

    $sql = "UPDATE Blog SET " . implode(', ', $set_clauses) . " WHERE Id = ?";
    $params[] = $id;

    // Determine types: all 's' except the last one 'i'
    $types = str_repeat('s', count($params) - 1) . 'i';

    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, $types, ...$params);

    if (mysqli_stmt_execute($stmt)) {
        sendResponse(201, true, 'Blog updated', ['id' => $id]);
    } else {
        sendResponse(500, false, 'Failed to update blog');
    }
}

//update($conn);
EOPHP

# Create blog.php
cat <<'EOPHP' > blog/blog.php
<?php
require_once '../../utility/conn.php';
require_once '../../utility/responseHandler.php';

switch ($_SERVER['REQUEST_METHOD']) {
    case 'GET':
        if (isset($_GET["get-for-update"])) {
            require_once './getByIdForUpdate.php';
            getByIdForUpdate($conn, $_GET["get-for-update"]);
        } elseif (isset($_GET["id"])) {
            require_once './getById.php';
            getById($conn, $_GET["id"]);
        } else {
            require_once './get.php';
            getAll($conn);
        }
        break;
    case 'POST':
        if (isset($_GET["id"])) {
            require_once './update.php';
            update($conn);
        } else {
            require_once './create.php';
            create($conn);
        }
        break;
    case 'DELETE':
        require_once './delete.php';
        delete_($conn, $_GET["id"]);
        break;
    default:
        sendResponse(405, false, 'Method Not Allowed');
        break;
}
EOPHP

echo "Blog API files have been set up successfully in the 'blog' directory."
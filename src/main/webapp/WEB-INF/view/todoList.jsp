<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>To-Do List</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.6.9/flatpickr.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .card {
            margin-bottom: 20px;
        }
        .todo-list-wrapper {
            margin-top: 20px;
        }
        .todo-list-body {
            max-height: 400px;
            overflow-y: auto;
        }
        .bottom-btn {
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>

<div class="container mt-5">
    <!-- To-Do List Section -->
    <section class="card">
        <header class="card-header">
            <h2 class="card-title d-flex justify-content-between align-items-center">
                To Do
                <button class="btn btn-primary" data-toggle="modal" data-target="#VIEW_TodoList"><i class="fa-solid fa-plus mr-2"></i> 등록</button>
            </h2>
        </header>
        <div class="card-body px-5 py-4">
            <div class="todo">
                <div class="todo-list-wrapper">
                    <ul class="nav nav-tabs" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" id="report_super" data-toggle="tab" href="#todo_ing" aria-controls="home" role="tab" aria-selected="true">진행중</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="report_schedule" data-toggle="tab" href="#todo_end" aria-controls="profile" role="tab" aria-selected="false">완료</a>
                        </li>
                    </ul>

                    <div class="tab-content">
                        <div class="tab-pane active pt-0" id="todo_ing" aria-labelledby="home-tab" role="tabpanel">
                            <div class="d-flex justify-content-between mb-2">
                                <div class="d-flex gap-3 text-muted">
                                    <span class="text-primary"><i class="fas fa-info-circle mr-1"></i> 마감일</span>
                                    <span>/</span>
                                    <span class="text-danger">지난 마감일</span>
                                    <span>/</span>
                                    <span>시작일</span>
                                </div>
                                <div class="mark-all-tasks d-flex gap-3">
                                    <button type="button" id="mark-finished" class="btn btn-outline-secondary" onclick="getCompleteList()"><i class="fa-solid fa-check mr-2"></i> 완료</button>
                                    <button type="button" id="mark-all-finished" class="btn btn-outline-secondary"><i class="fa-solid fa-check mr-2"></i> 전체 완료</button>
                                </div>
                            </div>
                            <div class="todo-list-body">
                                <ul id="todo-live-list">
                                    <!-- Dynamic todo list items will go here -->
                                </ul>
                            </div>
                        </div>

                        <div class="tab-pane pt-0" id="todo_end" aria-labelledby="home-tab" role="tabpanel">
                            <div class="d-flex justify-content-between mb-2">
                                <div class="d-flex gap-3 align-items-center">
                                    <input type="text" class="form-control flatpickr-month" data-gbn="date" data-id="TODO_SEARCH_MONTH" name="" placeholder="월별선택" style="width: 120px;">
                                    <button type="button" class="btn btn-outline-secondary" onclick="selectMonth()"><i class="fa-regular fa-calendar mr-1"></i>기간지정</button>
                                    <p class="ml-3 text-muted" id="TODO_SEARCH_DATE"></p>
                                    <input type="hidden" data-id="TODO_SEARCH_DATE_STR">
                                    <input type="hidden" data-id="TODO_SEARCH_DATE_END">
                                </div>
                                <div>
                                    <button type="button" class="btn btn-outline-primary" onclick="getRollBackList()"><i class="fa-solid fa-arrow-rotate-left mr-2"></i> 복원</button>
                                </div>
                            </div>
                            <div class="todo-list-body">
                                <ul id="todo-done-list">
                                    <!-- Dynamic done list items will go here -->
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>

<!-- To-Do Registration Modal -->
<div class="modal fade" id="VIEW_TodoList" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header bg-primary text-white">
                <h5 class="modal-title" id="exampleModalLabel">To Do Message</h5>
                <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body px-5 py-4">
                <form id="frmTODO" target="_self">
                    <div class="form-group row">
                        <label class="col-md-2 col-form-label text-md-right pt-2" for="TIT">제목</label>
                        <div class="col-md-10">
                            <input type="hidden" autocomplete="off" class="form-control" id="SEQ" data-id="SEQ" name="SEQ" data-gbn='txt'>
                            <input type="text" autocomplete="off" class="form-control" id="TIT" data-id="TIT" name="TIT" data-gbn='txt'>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-md-2 col-form-label text-md-right pt-2">시작일</label>
                        <div class="col-md-4">
                            <input type="text" autocomplete="false" class="form-control flatpickr-basic" data-gbn='date' id="NTE_STR_DT" data-id="NTE_STR_DT" name="NTE_STR_DT" placeholder="YYYY-MM-DD">
                        </div>
                        <label class="col-md-2 col-form-label text-md-right pt-2">마감일</label>
                        <div class="col-md-4">
                            <input type="text" autocomplete="false" class="form-control flatpickr-basic" data-gbn='date' id="END_DT" data-id="END_DT" name="END_DT" placeholder="YYYY-MM-DD">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-md-2 col-form-label text-md-right pt-2" for="CNTE">내용</label>
                        <div class="col-md-10">
                            <textarea class="form-control" rows="5" data-gbn="txtArea" id="CNTE" data-id="CNTE" name="CNTE" data-plugin-textarea-autosize></textarea>
                        </div>
                    </div>
                </form>
                <div class="bottom-btn mt-3">
                    <button type="button" class="btn btn-primary" id="submitButton" onclick="TODO_SUBMIT('N')">저장</button>
                    <button type="button" class="btn btn-primary" onclick="TODO_SUBMIT('Y')">저장 후 일정 추가</button>
                    <button type="reset" class="btn btn-outline-secondary" data-dismiss="modal">닫기</button>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.6.9/flatpickr.min.js"></script>
<script>
    $(document).ready(function(){
        $('.flatpickr-basic').flatpickr();
    });

    function callREGIST_TODO_POP() {
        $('#VIEW_TodoList').modal('show');
    }

    function TODO_SUBMIT(type) {
        // TODO submit function logic
        alert("TODO submitted with type: " + type);
    }

    function getCompleteList() {
        // Logic to mark selected todos as complete
        alert("Marking selected todos as complete");
    }

    function getRollBackList() {
        // Logic to roll back selected todos
        alert("Rolling back selected todos");
    }

    function selectMonth() {
        // Logic to select month for todos
        alert("Selecting month for todos");
    }
</script>

</body>
</html>


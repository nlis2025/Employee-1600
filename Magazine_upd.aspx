<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Magazine_upd.aspx.cs" Inherits="empinfo.Magazine_upd" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <title>仁寶園地投稿</title>
    <style>
        html {
            image-rendering: -webkit-optimize-contrast;
        }
    </style>
</head>
<body>
    <div id="NODiv" class="container-fluid" runat="server" visible="false" >
        <%-- style="display:none" --%>
        <div class="row">
            <div class="col-2"></div>
            <div class="col text-center">
                <h1>本期投稿已截止，下次徵稿活動將再公告，感謝！</h1>
            </div>
            <div class="col-2"></div>
        </div>
    </div>
    <form id="form1" runat="server" visible="true">
        <div class="container-fluid">
            <div class="row">
                <div class="col-2"></div>
                <div class="col text-center">
                    <h1>仁寶園地投稿</h1>
                </div>
                <div class="col-2"></div>
            </div>
            <div class="row">
                <div class="col-2"></div>
                <div class="col">
                    工號：<asp:Label ID="Label3" runat="server"></asp:Label>
                </div>
                <div class="col-2"></div>
            </div>
            <div class="row">
                <div class="col-2"></div>
                <div class="col">
                    姓名：<asp:Label ID="Label4" runat="server"></asp:Label>
                </div>
                <div class="col-2"></div>
            </div>
            <div class="row">
                <div class="col-2"></div>
                <div class="col">
                    部門：<asp:Label ID="Label5" runat="server"></asp:Label>
                </div>
                <div class="col-2"></div>
            </div>
            <br />
            <div class="row">
                <div class="col-2"></div>
                <div class="col">
                    <label for="DropDownList1">類別</label>
                    <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True">
                        <%--CssClass="form-select"--%>
                    </asp:DropDownList>
                </div>
                <div class="col-2"></div>
            </div>
            <div class="row" id="divTitle" runat="server">
                <div class="col-2"></div>
                <div class="col">
                    <label for="TextBox1">主題 </label>
                    <asp:TextBox ID="TextBox1" runat="server" Width="600"></asp:TextBox>
                </div>
                <div class="col-2"></div>
            </div>
            <div class="row" id="divPic1" runat="server">
                <div class="col-2"></div>
                <div class="col">
                    <label for="TextBox2">照片1主題 </label>
                    <asp:TextBox ID="TextBox2" runat="server" Width="600"></asp:TextBox>
                </div>
                <div class="col-2"></div>
            </div>
            <div class="row" id="divPic2" runat="server">
                <div class="col-2"></div>
                <div class="col">
                    <label for="TextBox3">照片2主題 </label>
                    <asp:TextBox ID="TextBox3" runat="server" Width="600"></asp:TextBox>
                </div>
                <div class="col-2"></div>
            </div>
            <div class="row" id="divPic3" runat="server">
                <div class="col-2"></div>
                <div class="col">
                    <label for="TextBox4">照片3主題 </label>
                    <asp:TextBox ID="TextBox4" runat="server" Width="600"></asp:TextBox>
                </div>
                <div class="col-2"></div>
            </div>
            <div class="row" id="divDoc" runat="server">
                <div class="col-2"></div>
                <div class="col">
                    <label for="FileUpload1">圖文檔</label>
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                    <span class="text-danger">word檔
                            <span id="spanFile1" runat="server">(所有照片主題的敘述說明，煩請直接彙整成一份word後再上傳)
                                    <button type="button" class="btn btn-sm btn-primary" data-bs-toggle="modal" data-bs-target="#myModal">
                                        圖文檔範例
                                    </button>
                            </span>
                        <span id="spanFile1_Baby" runat="server">
                            <button type="button" class="btn btn-sm btn-primary" data-bs-toggle="modal" data-bs-target="#myModal_Baby">
                                圖文檔範例
                            </button>
                        </span>
                    </span>
                </div>
                <div class="col-2"></div>
            </div>
            <div class="row">
                <div class="col-2"></div>
                <div class="col">
                    <label for="FileUpload2">照片檔</label>
                    <asp:FileUpload ID="FileUpload2" runat="server" /><span class="text-danger">jpg檔(勿超過2MB)，若有2張以上的照片，請打包成壓縮檔再上傳</span>
                </div>
                <div class="col-2"></div>
            </div>
            <div class="row">
                <div class="col-2"></div>
                <div class="col">
                    <asp:Label ID="Label1" runat="server" CssClass="form-text"></asp:Label>
                </div>
                <div class="col-2"></div>
            </div>
            <div class="row">
                <div class="col-2"></div>
                <div class="col">
                    <%--<input id="File1" type="file"  runat="server" class="btn-warning" />--%>
                    <asp:Button ID="Button1" runat="server" Text="送出" CssClass="btn btn-warning" OnClick="Button1_Click" />
                </div>
                <div class="col-2"></div>
            </div>
            <div class="row">
                <div class="col"></div>
                <div class="col">
                    <h1 class="text-primary">
                        <asp:Label ID="Label2" runat="server" Visible="false"></asp:Label><asp:Label ID="Label7" runat="server" Visible="False"></asp:Label></h1>
                </div>
                <div class="col"></div>
            </div>
            <div class="row">
                <div class="col-2"></div>
                <div class="col form-text">
                    <hr />
                    <b>[注意事項]</b><br />
                    <span class="text-danger">不得請他人代投作品，違反者將不再受理所投稿之稿件。<br />
                        刊登之投稿作品將提供稿費，稿費於每期公告出刊後發放。</span><br />
                    同仁投稿請注意遵守著作權法，切勿下載或抄襲他人於網路或媒體所發表的作品投稿，以免觸犯著作權法，<span class="text-danger">違反者將不再受理所投稿之稿件。</span><br />
                    同仁投稿稿件之刊登，將由編輯室依當期稿件的同質性多寡及內容品質做衡量後，再決定是否刊登或留待下期刊出，未刊登稿件將不再另行退回投稿人。<br />
                    若未註明投稿類別，編輯室將依據稿件內容歸類至合適的類別中進行審件。	
                </div>
                <div class="col-2"></div>
            </div>
            <div class="row">
                <div class="col-2"></div>
                <div class="col form-text">
                    <br />
                    <br />
                    若有問題，煩請聯繫alice_yang#10389（<a href="mailto:Yang. Alice (TPE) <Alice_Yang@compal.com>?Subject=【仁寶園地投稿】問題....">alice_yang@compal.com</a>)	
                </div>
                <div class="col-2"></div>
            </div>
        </div>
        <!-- 影像空間The Modal -->
        <div class="modal" id="myModal">
            <div class="modal-dialog">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">圖文檔範例</h4>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">
                        <img src="images\word內文說明.JPG" width="480" height="300" />
                    </div>

                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">關閉</button>
                    </div>

                </div>
            </div>
        </div>
        <!-- 家有寶貝The Modal -->
        <div class="modal" id="myModal_Baby">
            <div class="modal-dialog">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">圖文檔範例</h4>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">
                        <img src="images\家有寶貝_範例.JPG" width="480" height="300" />
                    </div>

                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">關閉</button>
                    </div>

                </div>
            </div>
        </div>
    </form>
    <!-- Latest compiled and minified JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

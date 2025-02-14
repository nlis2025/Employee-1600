<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="suggestion.aspx.cs" Inherits="empinfo.suggestion" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" /><meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <title>員工意見箱</title>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
    <script src="csspng/jquery.ifixpng.js"></script>
    <script language="JavaScript" type="text/javascript" src="csspng/iepngfix_tilebg.js"></script>
    <script>
        $(function () {
            $("*").ifixpng();
        });
        function img_t() {
            $('img').ifixpng();
        }

        //可上傳的副檔名
        fOK = ".gif.png.jpg.jpeg.zip.7z";
        //主題：其他，會帶出填寫類別
        function displayTextSelect(val) {
            if (val == "其他") {
                document.getElementById('lblOption').style.display = 'inline';
                document.getElementById('idTxtType').style.display = 'inline';

            }
            else {
                document.getElementById('lblOption').style.display = 'none';
                document.getElementById('idTxtType').style.display = 'none';
            }
        }
        function checkForm() {
            var bOK = true;
            var str = "";
            emailRule = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z]+$/;
            if (document.getElementById('DropDownList2').value == "請選擇") {
                str += "請選擇反應哪個廠區的意見!\n";
                bOK = false;
            }
            if (document.getElementById('txtContent').value == "") {
                str += "請填寫內容!\n";
                bOK = false;
            }if (document.getElementById('txtContent').value.length > 800) {
                str += "字數限制700字內，請重新檢視內容內文，再按送出。\n";
                bOK = false;
            }
            if (document.getElementById('txtCOMID').value == "") {
                str += "請填寫工號!\n";
                bOK = false;
            }
            if (document.getElementById('txtName').value == "") {
                str += "請填寫姓名!\n";
                bOK = false;
            }
            if (document.getElementById('txtMail').value == "") {
                str += "請填寫電子郵件!\n";
                bOK = false;
            }
            else if(document.getElementById('txtMail').value.search(emailRule)== -1){
                str += "電子郵件格式錯誤!\n";
                bOK = false;
            }
            //myfile = document.getElementById('FileUpload1');
            //if (myfile.files) {
            //    filesize = myfile.files[0].size;
            //    ftype = myfile.files[0].
            //}
            //else {
            //    try {//IE寫法
            //        var path, fso;
            //        path = document.getElementById('FileUpload1').value;
            //        fso = new ActiveXObject("Scripting.FileSystemObject");
            //        filesize = fso.GetFile(path).size;
            //        alert(path.substring(path.lastIndexOf('.')));
            //    }
            //    catch (e) {
            //        alert(e.message);
            //        filesize = 'error';
            //    }
            //}
            
            if (document.getElementById('FileUpload1').value != "") {
                sErr = checkFile(document.getElementById('FileUpload1'));
                if (sErr != "") {
                    str += sErr;
                    bOK = false;
                }
            }

            if (!bOK)
                alert(str);
            //ie不支援
            //f = document.getElementById('FileUpload1')
            //console.log(f.files[0]);
            //alert(f.files[0].size);

            return bOK;
        }

        function uploadFile(myfile) {
            sErr = checkFile(myfile);
            if (sErr != "")
                alert(sErr);
        }

        function checkFile(myfile)
        {
            sErr = "";
            if (myfile.files) {
                filesize = myfile.files[0].size;
                fname = myfile.files[0].name.substring(myfile.files[0].name.lastIndexOf('.'));
            }
            else {
                try {//IE寫法
                    var path, fso;
                    path = document.getElementById('FileUpload1').value;
                    fso = new ActiveXObject("Scripting.FileSystemObject");
                    filesize = fso.GetFile(path).size;
                    fname = path.substring(path.lastIndexOf('.'));
                }
                catch (e) {
                    alert(e.message);
                    filesize = 'error';
                }
            }
            fNum = fOK.indexOf(fname.toLowerCase());
            if (fNum < 0)
                sErr +="檔案僅接受gif, png, jpg, zip, 7z 格式\n";
            else if (filesize > 524288)
                sErr += "檔案Size超過512KB\n";

            return sErr;
        }

        function clean() {
            document.getElementById('txtCOMID').value = "";
            document.getElementById('txtName').value = "";
            document.getElementById('txtMail').value = "";
            document.getElementById('txtPhone').value = "";
            document.getElementById('txtDirect').value = "";
            document.getElementById('idTxtType').value = "";
            document.getElementById('txtContent').value = "";
        }
    </script>
    <link rel="SHORTCUT ICON" href="images/compal-wbe-logo.ico"/>
    <link href="empinfo_main.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="css/2-1-style.css" type="text/css" />
    <style type="text/css">
    <!--
    body {
	    background-color: #FFF;
    }
    -->
    </style>
</head>
<body>
    <form id="form1" runat="server" enableviewstate="False">
		<div id="top">
   <img src="images/topbg_s.jpg" width="1920" height="230" border="0" />
   <%--<iframe src="topframe-aspx.html" width="1920" height="70" marginwidth="0" marginheight="0" scrolling="no" frameborder="0" align="center"></iframe>--%>
</div> 
<div id="container">
<div id="company">
        <div id="main">
            <div>
                <div style="padding: 0px 0px 0px 190px; width: 920px;">
                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tbody>
                            <tr>
                                <td align="left" valign="top">&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="txt_link" align="left" valign="top">如果您對公司有任何的意見或看法，請您透過此信箱告訴我們。<br />
                                    我們將十分樂意為您解答任何問題，並企盼透過您的良善建議，使公司朝向更好的方向發展。<p>
                                        <b>
                                            <font color="#cc0000">
				為加速您的問題能有效地被處理與回覆，若有屬於電腦相關的問題，請直接播打**199報修或進入<a href="http://tpecnswww/helpdesk/">IT 
				Call Center平台</a></font></b>
                                    </p>
                                    <p><b><font color="#cc0000">若有屬於總務及大樓設備的問題，請直接進入<a rel="URLDescription.aspx?i=335" href="http://tpecnswww/gars/">總務及大樓設備叫修平台</a>，皆有專人立即提供服務</font></b></p>
                                    <p><font color="#cc0000">職場暴力(含性騷擾)申訴信箱：<a href="mailto:sh@compal.com">sh@compal.com</a> <!---相關辦法請參閱<a href="http://tpewww/Compal/Tpe/adm/empinfo/性騷擾防治措施申訴及懲戒辦法.pdf">性騷擾防治措施申訴及懲戒辦法</a></font></p>--->
                                </td>

                            </tr>
                            <tr>
                                <td align="left" valign="top">
                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                        <tbody>
                                            <tr>
                                                <td align="left" valign="top">
                                                    <table border="0" cellpadding="0" cellspacing="0">
                                                        <tbody>
                                                            <tr>
                                                                <td class="txt_title" align="left" valign="bottom">《意見回饋》</td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                    紅色標示項目為必填</td>
                                            </tr>
                                            <tr>
                                                <td align="left" valign="top">
                                                    <table border="0" cellpadding="6" cellspacing="0" width="100%">
                                                        <tbody>
                                                            <tr>
                                                                <td class="border_04" align="left" valign="middle" width="150"><span class="co_02">◆</span> 意見類別：</td>
                                                                <td class="border_04" align="left" valign="middle">
                                                                    <table border="0" cellpadding="0" cellspacing="0">
                                                                        <tbody>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:RadioButton ID="RadioButton1" runat="server" GroupName="radioSugg" Text="問題反應" />
                                                                                    <asp:RadioButton ID="RadioButton2" runat="server" GroupName="radioSugg" Text="建議" Checked="true" />
                                                                                    <asp:RadioButton ID="RadioButton3" runat="server" GroupName="radioSugg" Text="稱讚" />
                                                                                </td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="border_04" align="left" height="25" valign="middle"><span class="co_02">◆</span> <label for="selectType">主題：</label></td>
                                                                <td class="border_04" align="left" valign="middle">
                                                                    <table border="0" cellpadding="0" cellspacing="0">
                                                                        <tbody>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:DropDownList ID="selectType" runat="server" onchange="displayTextSelect(this.value);">
                                                                                        <asp:ListItem>公司制度</asp:ListItem>
                                                                                        <asp:ListItem>工作環境</asp:ListItem>
                                                                                        <asp:ListItem>員工福利</asp:ListItem>
                                                                                        <asp:ListItem>出差問題</asp:ListItem>
                                                                                        <asp:ListItem>其他</asp:ListItem>
                                                                                    </asp:DropDownList>
                                                                                </td>
                                                                                <td>
                                                                                    <label id="lblOption" style="display: none;">請填寫類別：</label></td>
                                                                                <td>
                                                                                    <asp:TextBox ID="idTxtType" runat="server" Style="width: 250px; display: none;" class="txt_f01"></asp:TextBox></td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="border_04" align="left" valign="middle"><span class="co_01">◆</span> <label for="selectType">反應哪個廠區的意見：</label></td>
                                                                <td class="border_04" align="left" valign="middle">
                                                                    <table border="0" cellpadding="0" cellspacing="0">
                                                                        <tbody>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:DropDownList ID="DropDownList2" runat="server" onchange="displayTextSelect(this.value);">
                                                                                        <asp:ListItem>請選擇</asp:ListItem>
                                                                                        <asp:ListItem>台北總部</asp:ListItem>
                                                                                        <asp:ListItem>SDBG</asp:ListItem>
                                                                                        <asp:ListItem>林口</asp:ListItem>
                                                                                        <asp:ListItem>平鎮廠</asp:ListItem>
                                                                                        <asp:ListItem>力特廠</asp:ListItem>
                                                                                    </asp:DropDownList>
                                                                                </td>
                                                                                <td>
                                                                                    <label id="lblOption" style="display: none;">請填寫類別：</label></td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="border_04" align="left" valign="middle"><span class="co_01">◆</span>&nbsp;<label for="txtContent">內容：（字數限制700字內）</label></td>
                                                                <td class="border_04" align="left" valign="middle">
                                                                    <asp:TextBox ID="txtContent" runat="server" class="txt_f01" Style="width: 99%;" Rows="3" TextMode="MultiLine"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td class="border_04" align="left" valign="middle"><span class="co_02">◆</span>&nbsp;<label for="FileUpload1">附加檔案：</label></td>
                                                                <td class="border_04" align="left" valign="middle">
                                                                    <asp:FileUpload ID="FileUpload1" runat="server" onchange="uploadFile(this)" />(僅接受gif, png, jpg, zip, 7z 格式，Size 需小於512KB，多檔上傳請壓縮再傳) 
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left" valign="top">
                                                    <table border="0" cellpadding="0" cellspacing="0">
                                                        <tbody>
                                                            <tr>
																<td class="txt_title" align="left" valign="bottom">《聯絡方式》</td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left" valign="top">
                                                    <table border="0" cellpadding="6" cellspacing="0" width="100%">
                                                        <tbody>
                                                            <tr>
                                                                <td class="border_04" align="left" valign="middle" width="150"><span class="co_01">◆</span> <label for="txtCOMID">工號：</label></td>
                                                                <td class="border_04" align="left" valign="middle">
                                                                    <asp:TextBox ID="txtCOMID" runat="server" Style="width: 100px;" class="txt_f01" ReadOnly="true"></asp:TextBox>
                                                            </tr>
                                                            <tr>
                                                                <td class="border_04" align="left" valign="middle" width="100"><span class="co_01">◆</span> <label for="txtName">中文姓名：</label></td>
                                                                <td class="border_04" align="left" valign="middle">
                                                                    <asp:TextBox ID="txtName" runat="server" Style="width: 100px;" class="txt_f01" ReadOnly="true"></asp:TextBox>
                                                            </tr>
                                                            <tr>
                                                                <td class="border_04" align="left" valign="middle"><span class="co_01">◆</span> <label for="txtMail">電子郵件：</label></td>
                                                                <td class="border_04" align="left" valign="middle">
                                                                    <asp:TextBox ID="txtMail" runat="server" Style="width: 300px;" class="txt_f01" ReadOnly="true"></asp:TextBox>
                                                            </tr>
                                                            <tr>
                                                                <td class="border_04" align="left" valign="middle"><span class="co_02">◆</span> <label for="txtPhone">分機或聯絡電話：</label></td>
                                                                <td class="border_04" align="left" valign="middle">
                                                                    <asp:TextBox ID="txtPhone" runat="server" Style="width: 100px;" class="txt_f01"></asp:TextBox>
                                                                    分機
	                                                                <asp:TextBox ID="txtDirect" runat="server" Style="width: 40px;" class="txt_f01"></asp:TextBox>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center" valign="bottom">
                                                    <div id="pages2">
                                                        <asp:Button ID="Button1" runat="server" Text="送出" OnClick="Button1_Click1" OnClientClick="return checkForm();" />
                                                        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="清除" />
                                                        <%--<input value="清除表單" type="button" onclick="clean();"  />--%>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </form>
</body>
</html>

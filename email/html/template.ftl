<#macro htmlEmailLayout>
<html
  xmlns:v="urn:schemas-microsoft-com:vml"
  xmlns:o="urn:schemas-microsoft-com:office:office"
  xmlns:w="urn:schemas-microsoft-com:office:word"
  xmlns:dt="uuid:C2F41010-65B3-11d1-A29F-00AA00C14882"
  xmlns:m="http://schemas.microsoft.com/office/2004/12/omml"
  xmlns="http://www.w3.org/TR/REC-html40"
>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="Generator" content="Microsoft Word 15 (filtered medium)" />
  </head>
  <body
    bgcolor="#D8D8D8"
    lang="EN-GB"
    link="blue"
    vlink="purple"
    style="word-wrap: break-word"
  >
    <div class="WordSection1">
      <div align="center">
        <table
          class="MsoTableGrid"
          border="0"
          cellspacing="0"
          cellpadding="0"
          width="567"
          style="width: 15cm; border-collapse: collapse; border: none"
        >
          <tr>
            <td
              valign="top"
              style="background: white; padding: 14.2pt 14.2pt 14.2pt 14.2pt"
            >
              <#nested "text">
            </td>
          </tr>
          <tr>
            <td
              valign="top"
              style="background: #212529; padding: 14.2pt 14.2pt 14.2pt 14.2pt"
            >
              <p
                class="MsoNormal"
                style="
                  mso-margin-top-alt: 0cm;
                  margin-right: 0cm;
                  margin-bottom: 12pt;
                  margin-left: 0cm;
                  line-height: normal;
                "
              >
                <span style="font-family: 'Arial', sans-serif; color: white"
                  ><#nested "footer"></span
                >
              </p>
            </td>
          </tr>
          <tr style="height: 1.05pt">
            <td
              valign="top"
              style="
                background: #1a1e21;
                padding: 14.2pt 14.2pt 14.2pt 14.2pt;
                height: 1.05pt;
                text-align: center;
              "
            >
              <p class="MsoNormal" style="margin-top: 0cm; line-height: normal">
                <span style="font-family: 'Arial', sans-serif; color: white;"
                  >made with ❤ in egham</span
                >
              </p>
            </td>
          </tr>
        </table>
      </div>
    </div>
  </body>
</html>
</#macro>

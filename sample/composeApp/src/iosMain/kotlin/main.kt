import androidx.compose.ui.window.ComposeUIViewController
import org.rofiqoff.flagx.App
import platform.UIKit.UIViewController

fun MainViewController(): UIViewController = ComposeUIViewController { App() }
